Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341B8477280
	for <lists+linux-omap@lfdr.de>; Thu, 16 Dec 2021 14:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbhLPNBD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Dec 2021 08:01:03 -0500
Received: from mail.wizzup.org ([95.217.97.174]:44550 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237140AbhLPNBD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Dec 2021 08:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=3IdJwaBkIhW1mqdcuXX8lwN/Kp/+vT5tCSuSUG8kRU8=; b=CGUvcYCGyiAU1coOKe89rNIUG7
        Sn+pkTgBaqTeGobLH+q5RplpL8p+SSLVr4fcpocSZOCUqbrXuv1xpoFJmn6o2hyFjL9OutsuN1bG+
        GRwW2gFPRtGU/FvqqVm++GXvO+wJZBmlaAuwjI/i2nv9K7JN5YP33T1IclW+Rgin/HPqsqivjsD0t
        0BLZ7qCnTllJWMQIqrcEOVIS5KKK6w3x+y2nrP0k7gCNJf2jiMx/wlgjqzjdXiURtUX9fGcC5bnDM
        ccguH5mOPUz3ZWhFCwMwb/gJLylypyIx84rsL2itnTKvhuEh2P+LnRJ3tcN0TA49CgV6oigi0Up/w
        sTvk88aA==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mxqNU-0004Px-0E; Thu, 16 Dec 2021 13:00:56 +0000
To:     Sebastian Reichel <sre@kernel.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>, Pavel Machek <pavel@ucw.cz>,
        Tony Lindgren <tony@atomide.com>
References: <001a77db-80c0-d000-3d78-b9b301669826@wizzup.org>
 <20211213131023.ese6lrkayj4qopfa@earth.universe>
From:   Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: Nokia N900 increased power draw with panel-sony-acx565akm loaded
 v5.9 and v5.10
Message-ID: <968dbb4a-3944-7226-d686-379a442be7ef@wizzup.org>
Date:   Thu, 16 Dec 2021 14:06:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211213131023.ese6lrkayj4qopfa@earth.universe>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

On 13/12/2021 14:10, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Dec 10, 2021 at 08:18:35PM +0100, Merlijn Wajer wrote:
> 
>> Any hints on what could cause this extra power draw? Maybe the panel is
>> waiting for something? I suppose it's potentially feasible that with
>> more modules and userspace loaded the panel idles properly, but I
>> currently don't have a way to measure that.
> 
> First of all: I do not have documentation for that panel. Before my
> patch what happened was that gpiod_get() initialized the reset GPIO
> as OUTPUT_LOW. Immediately afterwards it is configured as OUTPUT_HIGH
> in acx565akm_detect(). So there are 2 options:
> 
> 1. The reset GPIO was low before the driver probe starts. In that
>    case everything is fine with or without 7c4bada12d320 and there
>    is no expected change in behaviour. The GPIO is just toggled
>    slightly earlier.
> 
> 2. The reset GPIO was output-high before the driver probe starts
>    (e.g. because bootloader used the panel, kexec, ...). In that
>    case the reset GPIO will be low for just a very short time (just
>    a few instructions). Usually panels have a minimum time required
>    for reset lines to be asserted. In acx565akm_power_off() it is
>    hinted, that 100ms should be ok.
> 
> My patch fixes the behaviour, so that reset is no longer asserted
> for less than 100ms in the second case by not asserting it at all.
> That also means, that the LCD is not reset when it has already been
> configured before the probe routine is called. An alternative would
> be the following patch, which does the reset and ensures minimum
> reset times are ok:
> 
> ------------------------------------------------------
> git diff drivers/gpu/drm/panel/panel-sony-acx565akm.c
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> index ba0b3ead150f..2a8c0f7342ce 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> @@ -629,11 +629,12 @@ static int acx565akm_probe(struct spi_device *spi)
>         lcd->spi = spi;
>         mutex_init(&lcd->mutex);
>  
> -       lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
> +       lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
>         if (IS_ERR(lcd->reset_gpio)) {
>                 dev_err(&spi->dev, "failed to get reset GPIO\n");
>                 return PTR_ERR(lcd->reset_gpio);
>         }
> +       msleep(100); /* ensure minimum reset assertion time */
>  
>         ret = acx565akm_detect(lcd);
>         if (ret < 0) {
> ------------------------------------------------------

With this additional patch applied the device seems to idle at lower
power usage in the test environment I described in my previous email.
That is, it idles at at 42mW with the panel probed, as opposed to 60mW
with the panel probed. I also just booted to my Maemo Leste environment
and the panel still comes up fine and seems to behave fine.

Is there additional testing I can perform to make sure this patch is the
right one?

Thanks,
Regards,
Merlijn
