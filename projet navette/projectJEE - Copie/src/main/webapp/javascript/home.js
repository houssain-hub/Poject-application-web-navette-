// Set up IntersectionObserver to observe when the element comes into view
const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
        // If the element is in view
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
            observer.unobserve(entry.target); // Stop observing once the element is visible
        }
    });
}, {
    threshold: 0.5  // Trigger when 50% of the element is visible
});

// Target the elements to observe
const element1 = document.getElementById('carouselExampleCaptions');
const element2 = document.getElementById('animateElement2');
const element3 = document.getElementById('animateElement3');
const element4 = document.getElementById('animateElement4');
observer.observe(element1);
observer.observe(element2);
observer.observe(element3);
observer.observe(element4);
