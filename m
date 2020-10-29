Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6F529E26D
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 03:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgJ2COX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 22:14:23 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:39630 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgJ2COW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Oct 2020 22:14:22 -0400
Received: by mail-ej1-f66.google.com with SMTP id bn26so1701127ejb.6;
        Wed, 28 Oct 2020 19:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6JQiZAd6xHyfMhhZq7AApTbGmmllgVW7w4+YOA//K7o=;
        b=pM/ehFqPhBnTF7n94HFzmrLtOzTidHLcHQYllXxC2rg+Kz4CQEH+HAuO6tQfdPKxLi
         7o0S0aDI32y2eHuRLdbir7yiT53oFlvunZF709AeEH/X77//gOJKzGZnlLvq0nYkHgnr
         A3bT9iZlBWQdu0G2Wji61Lj4Gtr2OVTax5bPzOMcJJQY+yE7AjsZzKPlU7PNM4itid0L
         XUi+DmEKeOthbPppaFfLauKAScoSu3juylWekjGCs5Ei/JeRXx38ydPddG8sRou8nhuJ
         NYixx9LHFcYcUM6kfkRrKzaQtyQ+Iul6a7ZBnZTic09+WbCURouaDCpZODcADvo6FpWW
         mhIQ==
X-Gm-Message-State: AOAM531WBXgDzinSj3xJ9/HmRNwui4ue/DUD3XoZPCKCreqPBsuzhyJG
        P93UkNYDYdAVZgq+/unCYHR/Lb7Z7oF7Uw==
X-Google-Smtp-Source: ABdhPJzOsJM0Jg68AWxk3T2I+1KjCJLJGi21MgR+c0ixYAV4+m83fy11Yle3XjG5htkFRvECeSgPjQ==
X-Received: by 2002:a17:906:b110:: with SMTP id u16mr1903481ejy.55.1603937660294;
        Wed, 28 Oct 2020 19:14:20 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id r11sm652310edi.91.2020.10.28.19.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 19:14:20 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id 7so1754738ejm.0;
        Wed, 28 Oct 2020 19:14:20 -0700 (PDT)
X-Received: by 2002:a2e:5049:: with SMTP id v9mr855703ljd.273.1603937238672;
 Wed, 28 Oct 2020 19:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201028223009.369824-1-krzk@kernel.org> <20201028223009.369824-5-krzk@kernel.org>
In-Reply-To: <20201028223009.369824-5-krzk@kernel.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Thu, 29 Oct 2020 10:07:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v67puSi_wu4BV2Jac23MJMxGj33YJnZxwkfy4jHGYue+WA@mail.gmail.com>
Message-ID: <CAGb2v67puSi_wu4BV2Jac23MJMxGj33YJnZxwkfy4jHGYue+WA@mail.gmail.com>
Subject: Re: [RESEND PATCH 05/42] mfd: axp20x: use PLATFORM_DEVID_NONE
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "open list:BROADCOM BCM281XX..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andy@kernel.org>, Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2835..." 
        <linux-rpi-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNO..." 
        <linux-samsung-soc@vger.kernel.org>,
        "open list:OMAP2+ SUPPORT" <linux-omap@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 29, 2020 at 6:30 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Use PLATFORM_DEVID_NONE define instead of "-1" value because:
>  - it brings some meaning,
>  - it might point attention why auto device ID was not used.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
