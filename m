Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7EA43F836C
	for <lists+linux-omap@lfdr.de>; Thu, 26 Aug 2021 09:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240190AbhHZH5i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Aug 2021 03:57:38 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57298
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232223AbhHZH5g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 26 Aug 2021 03:57:36 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9BFA94075F
        for <linux-omap@vger.kernel.org>; Thu, 26 Aug 2021 07:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629964608;
        bh=JkuOywfaMdggVS4bli5HwaEPziu1ePITpUpnYUIyGCI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=g22iNUSHDQaFmPf/CoDp+boL3nHL5VNgVryPPaHHFnG6GRMvgeqvRL1OifX0z9qzs
         WCySZHPrR2BiNRrhXK2JNaRTCDvaO+y1t3ooW9qUsSE/monVc0sfRh0+X+neMFQQ0c
         OqDDyTL0HwbFwYb/1NAvMJvTybt7gLVsX6EFzyM9SlytirmjXyCOQHiOMPU5KToJKe
         GS6iREV+xibE0OPa8Zbd+OTUO5L0R3aZm1x8HDuODkMzsWiQyjaKmZncOVGYtvMZE9
         McKHXNl2/4/AdCWdsBg3+dnAYgAu0+DVva4aKn8KIfb3/Qar1GgaqUy9rbJVmDizTg
         WrQHf9j2Xw1uw==
Received: by mail-ej1-f70.google.com with SMTP id m18-20020a170906849200b005c701c9b87cso839304ejx.8
        for <linux-omap@vger.kernel.org>; Thu, 26 Aug 2021 00:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JkuOywfaMdggVS4bli5HwaEPziu1ePITpUpnYUIyGCI=;
        b=kXRpYoVKZO9HhMWzlZ9vsZ4nP2d6nvnXjYDO3bn1yVXiVo7ehWHsIAwDq8V+JzHb4x
         dTnb+EvPG6QlCBijHPreX3AbXJq3awU7X0B51NNmafLbWgsh80B1rXcz7yHpIoKLKIKj
         FnCNyZBXqG55RKFdy7YWZz36SqRDEjT7m3uAw9Hfy0/SSKUBcHejszo8VAUTj7KbZu/O
         K+hzrcte6IwT0NSeM6VM2yiYLHTwQaY9hS6CoCGg+7shZscEv0knmGXKNsPRtvOb97Y2
         ZiyJcW1ntmuUU4Z/rH+mNgXtNeOfTOxr0UtJv2GBYE9L79M/FerUXmakDKXJG0XBt83j
         thSw==
X-Gm-Message-State: AOAM53248bMLbW6uTJVsIXLQ5oVjm9YEc65WwbO48JbrR/pV2FKIfnU3
        wFHOtoa13IfcJBdl8HsQXNhclxTt0G0tOZQ/jk0tl7YLYj7yvxUGP0QLbk7kkREJ+etaxJY115A
        L1akoFrZZkE0Aemc7s4Ygf9d4pYaCUfucVb6aZF0=
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr2266829wru.315.1629964598111;
        Thu, 26 Aug 2021 00:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7z+KnpYY98pYyEqMF/A3NX8jxv23cu1YJnDvJUhoXHCtlFAZyyEs+2CZ1T1jeMVjcwD6U+g==
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr2266775wru.315.1629964597932;
        Thu, 26 Aug 2021 00:56:37 -0700 (PDT)
Received: from [192.168.0.103] ([79.98.113.122])
        by smtp.gmail.com with ESMTPSA id z19sm8834614wma.0.2021.08.26.00.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 00:56:37 -0700 (PDT)
Subject: Re: [PATCH v16 3/7] ARM: configs: Explicitly enable USB_XHCI_PLATFORM
 where needed
To:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Olivier Moysan <olivier.moysan@st.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        William Cohen <wcohen@redhat.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
References: <20210813195228.2003500-1-mka@chromium.org>
 <20210813125146.v16.3.I010d5725652b981ebbafba0b260190fe4b995a40@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d6f17e48-4cb5-d665-4770-a4cf0440f85b@canonical.com>
Date:   Thu, 26 Aug 2021 09:56:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813125146.v16.3.I010d5725652b981ebbafba0b260190fe4b995a40@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 13/08/2021 21:52, Matthias Kaehlcke wrote:
> The dependency of USB_DWC3 and USB_XHCI_MVEBU on USB_XHCI_PLATFORM
> is being changed from 'select' to 'depends on' by another patch.
> With that patch the defconfigs that enable one of these host
> controllers also need to select USB_XHCI_PLATFORM explicitly
> to keep the resulting config unchanged.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> 
> Changes in v16:
> - patch added to the series
> 
>  arch/arm/configs/exynos_defconfig    | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
