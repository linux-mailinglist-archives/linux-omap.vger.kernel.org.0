Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85D5E15B4A3
	for <lists+linux-omap@lfdr.de>; Thu, 13 Feb 2020 00:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbgBLX1Y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Feb 2020 18:27:24 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50649 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgBLX1Y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Feb 2020 18:27:24 -0500
Received: by mail-wm1-f66.google.com with SMTP id a5so4226140wmb.0;
        Wed, 12 Feb 2020 15:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qWWr8Tj/x5Uxzxfr4XDatmqFLDK9WTySpZSm5Bv0Ekw=;
        b=L6IULQpe2FXdlwNT2BiPLqWq4HKawYV5jKJh49o0/jP5CDMlvCqZK22kL7aN1LDv1f
         hKnKN29sw2xQ9cpKhAhNHODtLuSVrxF98GiCI8yuByWFJkHjVo8NQDoxUaoIaNnywUTr
         u7COFa6iqbCTJrkneJKEzzJW+vHp1Aujis9A6v+zMDKgP1FG19mzCGkUMjaez9si8j/G
         C0+L63IO28L9orTsObc2mFInroI3Ebit6T+cgK6I1LnPHpdj+BzG9+6DRW4CB8uSKpEV
         Y2xAzXbYQ83NSp123ZJnRj3Fek0lPZywolgT1jcuINgkJIddUKRpWeCNESRM29F01VRs
         geGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qWWr8Tj/x5Uxzxfr4XDatmqFLDK9WTySpZSm5Bv0Ekw=;
        b=IK9v180tWku7cx6K3CmNipqiLnKSe8FR76MxyTEnwzbTrtF33DGahvLDYWtGun1NCL
         uHMYib67r2bZWLuOAfENhOuBR5CHoO4fMXn0nGkRTUagCbpwDp+bY1Cbp18oDUVMgzam
         fA2+bnE7ruORyD4mEWV47Y7b0PZGsCZ7FtR7ozyLOQtpgOv8548eCz3dFHo0Lb9xYkl+
         6XNgo14eEeFRphitJqIeCDcT7e7HaIJd3n06SU8yyHj/R6l4iEQiL7lb9cryqryY8+Fo
         vWJFZZFpPc+eiwz7mz47joXzLOn/Vtpszbsl5NR+FpDGIetQCmeriYQj2iMhRGT1UFkf
         nU5Q==
X-Gm-Message-State: APjAAAXNHbSn4ta53XlqxXN1O5Z3OExKfJBjFnv26/IKeCFfkIXcVdm3
        P4tCv9nMgAXXMpAfaUo1dus=
X-Google-Smtp-Source: APXvYqzXjjXmlvG1lFGKwcAfviSyTGoEOxWVrTe8hKiSJsLeartclcgGBa+dNMyFSFP9DmQFyIBtxw==
X-Received: by 2002:a05:600c:242:: with SMTP id 2mr1463304wmj.2.1581550038818;
        Wed, 12 Feb 2020 15:27:18 -0800 (PST)
Received: from giga-mm ([62.68.27.198])
        by smtp.gmail.com with ESMTPSA id l6sm423504wmg.42.2020.02.12.15.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 15:27:17 -0800 (PST)
Date:   Thu, 13 Feb 2020 00:27:16 +0100
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Krzysztof Halasa <khalasa@piap.pl>,
        Russell King <linux@armlinux.org.uk>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Kevin Hilman <khilman@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Enrico Weigelt <info@metux.net>
Subject: Re: [PATCH 02/18] ARM: replace setup_irq() by request_irq()
Message-Id: <20200213002716.99258cfd73002fdd4bbd17d9@gmail.com>
In-Reply-To: <da7d11b6cf808ea95e2d852a2e8cbca3fde28b6f.1581478324.git.afzal.mohd.ma@gmail.com>
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
        <da7d11b6cf808ea95e2d852a2e8cbca3fde28b6f.1581478324.git.afzal.mohd.ma@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi!

On Wed, 12 Feb 2020 13:32:43 +0530
afzal mohammed <afzal.mohd.ma@gmail.com> wrote:

> request_irq() is preferred over setup_irq(). Existing callers of
> setup_irq() reached mostly via 'init_IRQ()' & 'time_init()', while
> memory allocators are ready by 'mm_init()'.
> 
> Per tglx[1], setup_irq() existed in olden days when allocators were not
> ready by the time early interrupts were initialized.
> 
> Hence replace setup_irq() by request_irq().
> 
> Seldom remove_irq() usage has been observed coupled with setup_irq(),
> wherever that has been found, it too has been replaced by free_irq().
> 
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
> 
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>

For the EP93xx part:
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> diff --git a/arch/arm/mach-ep93xx/timer-ep93xx.c b/arch/arm/mach-ep93xx/timer-ep93xx.c
> index de998830f534..0335f3b93340 100644
> --- a/arch/arm/mach-ep93xx/timer-ep93xx.c
> +++ b/arch/arm/mach-ep93xx/timer-ep93xx.c
> @@ -117,13 +117,6 @@ static irqreturn_t ep93xx_timer_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static struct irqaction ep93xx_timer_irq = {
> -	.name		= "ep93xx timer",
> -	.flags		= IRQF_TIMER | IRQF_IRQPOLL,
> -	.handler	= ep93xx_timer_interrupt,
> -	.dev_id		= &ep93xx_clockevent,
> -};
> -
>  void __init ep93xx_timer_init(void)
>  {
>  	/* Enable and register clocksource and sched_clock on timer 4 */
> @@ -136,7 +129,10 @@ void __init ep93xx_timer_init(void)
>  			     EP93XX_TIMER4_RATE);
>  
>  	/* Set up clockevent on timer 3 */
> -	setup_irq(IRQ_EP93XX_TIMER3, &ep93xx_timer_irq);
> +	if (request_irq(IRQ_EP93XX_TIMER3, ep93xx_timer_interrupt,
> +			IRQF_TIMER | IRQF_IRQPOLL, "ep93xx timer",
> +			&ep93xx_clockevent))
> +		pr_err("request_irq() on %s failed\n", "ep93xx timer");
>  	clockevents_config_and_register(&ep93xx_clockevent,
>  					EP93XX_TIMER123_RATE,
>  					1,

-- 
Alexander Sverdlin.
