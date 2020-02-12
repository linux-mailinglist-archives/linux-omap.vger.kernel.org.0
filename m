Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9855415A2EF
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 09:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgBLIKs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Feb 2020 03:10:48 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45246 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbgBLIKr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Feb 2020 03:10:47 -0500
Received: by mail-pl1-f193.google.com with SMTP id b22so651534pls.12
        for <linux-omap@vger.kernel.org>; Wed, 12 Feb 2020 00:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9CFz1c+0fNvk1cgA4VQ08nCs0e3XAVZxLPN7eKmCEBM=;
        b=a78fnOoI0rTVtIC+JFO46RJEEvzyk/fZDQMjE9y10nP/lGnhNPun68nys1C7h7sbzk
         9YBllWzWVhWfw2cmPFaTCCuEV2nfKqqHQCBcgPwbdR32gh5Rnixt+ZE8Kk/XxwlP/Tit
         bl/k27WscBk03Fii24U/Bn3YlT2V9B3tz0ikYzU680Oazv8B4sclT71RuUREhif3K3vf
         wl6SdhFyrDnFS9cRBTbGj4OpS5TePB2QBg4hAyuBUB5TNUR8LjMSxs2Zb6p3g5WUMHLd
         jd4FEJslzVsOyMGwzCouKDatnTR4RRkaFi7ML0j89ElqbYAkkDLBhf41JrX+fTQaso6j
         996A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9CFz1c+0fNvk1cgA4VQ08nCs0e3XAVZxLPN7eKmCEBM=;
        b=Y4N7cB9+9LVX06RTy3dHCCvnwWB67JKM8oS0e4LeEXlr4VTU1cShIft3gwgMFrQXvX
         1ZbVrjU6dR2epp9RIcmtKg/g5NdmyW4xKZAWWhchvXh753cDteT97le4wcwsBPFrahQW
         8i+iwqgz16Lye6aUxkDvx1sPHLbr/ROzSSRRzEQjSl9flCRmkFnJvru+CaEvnKE6vTT2
         5JKDagGdLL/mFZ/uwWMB23OHHEekhZxMni/zoT6s6Ih3WLVtH7OEy3rcqAft0WZfE8yP
         zeXE6/KOlEmeoC2HIvhnB3PzUv8Hn7gS6cg9avRSvu4si9I2cJlDT7gtsQk8sA2aAtx6
         jghg==
X-Gm-Message-State: APjAAAXyBDFaxhuPeZTFJHfv8XC0DCtRRYPimyDcq9qUnUxn5PqbFT+4
        0S4uFEjrszTMam0JNzUSbC9xfQ==
X-Google-Smtp-Source: APXvYqyjZYunT9oVxh3t0N0o3M6twZ6cdJ5DdSo7JxfAcL/PWmMM8SOizyCNVMM6Jdwf3Wer2aaM7A==
X-Received: by 2002:a17:90b:14a:: with SMTP id em10mr8645460pjb.4.1581495047048;
        Wed, 12 Feb 2020 00:10:47 -0800 (PST)
Received: from localhost ([122.167.210.63])
        by smtp.gmail.com with ESMTPSA id k8sm6926990pgg.18.2020.02.12.00.10.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Feb 2020 00:10:46 -0800 (PST)
Date:   Wed, 12 Feb 2020 13:40:44 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Krzysztof Halasa <khalasa@piap.pl>,
        Russell King <linux@armlinux.org.uk>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
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
Message-ID: <20200212081044.lsw6to5kmzl22ywc@vireshk-i7>
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
 <da7d11b6cf808ea95e2d852a2e8cbca3fde28b6f.1581478324.git.afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da7d11b6cf808ea95e2d852a2e8cbca3fde28b6f.1581478324.git.afzal.mohd.ma@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12-02-20, 13:32, afzal mohammed wrote:
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
> ---
>  arch/arm/mach-spear/time.c               |  9 ++-------
>
> diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
> index 289e036c9c30..92b2850eeb4f 100644
> --- a/arch/arm/mach-spear/time.c
> +++ b/arch/arm/mach-spear/time.c
> @@ -181,12 +181,6 @@ static irqreturn_t spear_timer_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static struct irqaction spear_timer_irq = {
> -	.name = "timer",
> -	.flags = IRQF_TIMER,
> -	.handler = spear_timer_interrupt
> -};
> -
>  static void __init spear_clockevent_init(int irq)
>  {
>  	u32 tick_rate;
> @@ -201,7 +195,8 @@ static void __init spear_clockevent_init(int irq)
>  
>  	clockevents_config_and_register(&clkevt, tick_rate, 3, 0xfff0);
>  
> -	setup_irq(irq, &spear_timer_irq);
> +	if (request_irq(irq, spear_timer_interrupt, IRQF_TIMER, "timer", NULL))
> +		pr_err("request_irq() on %s failed\n", "timer");
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
