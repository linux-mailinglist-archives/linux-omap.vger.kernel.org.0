Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91C05CD31F
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2019 17:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfJFPtG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Oct 2019 11:49:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44148 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbfJFPtE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Oct 2019 11:49:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id z9so12326229wrl.11;
        Sun, 06 Oct 2019 08:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gjm1dCZFYN9Q0YRQn+rV7fKQn2zR/3c5cBtHPYJQJTI=;
        b=dTtt+iMGk2SPxBtvEBGNfc5VgROZ5ol2Od/MfXC5VkQWe2ykGK4lvyCpuzLb3T0hvk
         NZEpvtnj/kBjmoQ1dORMw4MZ+JiFyCfPuLwq3tql4UbeU4CY7gGN12ggj8howTYQaBRp
         KRSndC1z/ForZrHfi/QgAVHISzlpYdGuZAWlUi3hUQnwRxPr621T1oknXlVbBT/2UjxM
         hR/uo6b4WNI/46noNQDAQM5xxqaDc9kAE8O1c0bCDUNCMa0BaU642yE5gABNv9FQg5PW
         80o/WfFWzoMgKWRXFy9l5uV8j87lE4m2WBZsJKe6M5iCQwphT8MfzcgC3laqX7qz4r/q
         K/fA==
X-Gm-Message-State: APjAAAXM6OvQ+ULEDltw6gI8o2fYVKK7NSdZ2tdfulsj+v/N2lpHM2ST
        CWIoQR8HVr8gn1/ZbnpqIAQ=
X-Google-Smtp-Source: APXvYqzy7hw7qBX+7YQlQBBRw9ZUpQoHKBW0OQ2DhXkAPv3j2tRRGjKiNpfzHfsJ4XmI2fnvsuRIaQ==
X-Received: by 2002:adf:e84c:: with SMTP id d12mr18308509wrn.373.1570376941723;
        Sun, 06 Oct 2019 08:49:01 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id y18sm31455093wro.36.2019.10.06.08.48.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Oct 2019 08:49:01 -0700 (PDT)
Date:   Sun, 6 Oct 2019 17:48:57 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 03/10] ARM: dts: exynos: Rename SysRAM node to "sram"
Message-ID: <20191006154857.GB29365@kozik-lap>
References: <20191002164316.14905-1-krzk@kernel.org>
 <20191002164316.14905-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191002164316.14905-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 02, 2019 at 06:43:09PM +0200, Krzysztof Kozlowski wrote:
> The device node name should reflect generic class of a device so rename
> the SysRAM node from "sysram" to "sram".  The child nodes stay as before
> as "smp-sysram" to match their real purpose.  This will be also in sync
> with upcoming DT schema.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 2 +-
>  arch/arm/boot/dts/exynos4210.dtsi | 2 +-
>  arch/arm/boot/dts/exynos4412.dtsi | 2 +-
>  arch/arm/boot/dts/exynos5250.dtsi | 2 +-
>  arch/arm/boot/dts/exynos54xx.dtsi | 2 +-

Applied this one to samsung-soc.

Best regards,
Krzysztof

