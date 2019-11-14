Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88DCDFC87C
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 15:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfKNOLw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 09:11:52 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:39594 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727180AbfKNOLu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Nov 2019 09:11:50 -0500
Received: by mail-vk1-f194.google.com with SMTP id j84so1494063vkj.6
        for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2019 06:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XSmwLWNo5Rh6fe+p8Uu7DFNnAFhXmFiTvhxWz1V+B8w=;
        b=Zxy9Va/g5HeujT0G/Yr81ssNa+Mrn59GATo64imHO5v4yPYwyPPGs095S9yLGHZZct
         1hxeTUWiuBZWvi+O1vf0npeqW5PjS6EDcNVV/BuKq+FHtrEOxZldeFAkfves+9/Zc/nA
         Jfl+7lufr0kMeZAOu4jE2erwkVZzPMxG8lpE6MQdIaqDuXXS5sdJm3+y9FiWm52EK2l3
         WwyGBsnQjzhGRAggZDE4omJqyKpHbyv37Af0YKrpFhQbUSYZTgpsAw3qsoRhd/fdwACE
         5iSUjaPDvT/GCI+c4fijdDcGkjUJFX9Fldn0zizjgcTiajuBoo8z8CbjC/JqAxv7Pnw6
         eStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XSmwLWNo5Rh6fe+p8Uu7DFNnAFhXmFiTvhxWz1V+B8w=;
        b=s/0uLT0mSpx+ys42P06YbdTdHK/wcQ6ev7RGI42sM4DfiFkFmdkf3HRZrgj1IjoJUk
         AKQcAb4zbsoXCobo0zaZp9khIY/2zj9MdQVqQo5NzYoOfZsoqazp+Jb0/82urVLGJYvB
         w/fXb2Rmj+DqOVhb4aZRFSSOIG4zANxY5CNlFFZf3nBpdgngZZpBG0xsdSs/0RLuY/GZ
         tvHTcSb8A0tmXHSBFGDkrUCJe2DbDBH686b/OjN5xNatKEmRXw5koV3uNAmWV/fbP6WS
         AAfAxe2PsTo7a+HL3PpVDA3Ywr0JO0vLrORmen0wA8bd7w2HpP/e9gAyTkoXZeShACBf
         P1pw==
X-Gm-Message-State: APjAAAWKBZBkBeJKI0eYdoMJmJYM1DkJ57UApk8X/gvPkoFDWyCkC+59
        0sVJbBINUrw+0WSTiZ6fLHDw7WcSqkEI9HzKdUmhkg==
X-Google-Smtp-Source: APXvYqxNH6tQ6y7J3OfkNA5oBwmBY5VTe296JKBsrF2xLv130hd/N0da6UeuSUpnmtRg4fw9qbywtQvMfesNLW0c7dc=
X-Received: by 2002:a1f:2f51:: with SMTP id v78mr5258686vkv.101.1573740707355;
 Thu, 14 Nov 2019 06:11:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573122644.git.hns@goldelico.com> <17b12e91c878dcb74160e3df5f88bc8a9e3f7fce.1573122644.git.hns@goldelico.com>
In-Reply-To: <17b12e91c878dcb74160e3df5f88bc8a9e3f7fce.1573122644.git.hns@goldelico.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 14 Nov 2019 15:11:11 +0100
Message-ID: <CAPDyKFpGU+tXC8thz52BQfKHNerzYSUroSihh6GpZELFm-1gRQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] Documentation: dt: wireless: update wl1251 for sdio
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Kalle Valo <kvalo@codeaurora.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        David Sterba <dsterba@suse.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        DTML <devicetree@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel@pyra-handheld.com,
        linux-wireless <linux-wireless@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 7 Nov 2019 at 11:32, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> The standard method for sdio devices connected to
> an sdio interface is to define them as a child node
> like we can see with wlcore.
>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Acked-by: Kalle Valo <kvalo@codeaurora.org>
> ---
>  .../bindings/net/wireless/ti,wl1251.txt       | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt b/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
> index bb2fcde6f7ff..f38950560982 100644
> --- a/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
> @@ -35,3 +35,29 @@ Examples:
>                 ti,power-gpio = <&gpio3 23 GPIO_ACTIVE_HIGH>; /* 87 */
>         };
>  };
> +
> +&mmc3 {
> +       vmmc-supply = <&wlan_en>;
> +
> +       bus-width = <4>;
> +       non-removable;
> +       ti,non-removable;
> +       cap-power-off-card;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&mmc3_pins>;
> +
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       wlan: wifi@1 {
> +               compatible = "ti,wl1251";
> +
> +               reg = <1>;
> +
> +               interrupt-parent = <&gpio1>;
> +               interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;  /* GPIO_21 */
> +
> +               ti,wl1251-has-eeprom;
> +       };
> +};

One minor thing, the "ti,power-gpio" is not required anymore, as it's
not needed for the SDIO case for pandora.

Please move it to an option section.

Kind regards
Uffe
