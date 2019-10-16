Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42F07D96DC
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 18:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393690AbfJPQSw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 12:18:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:32998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727154AbfJPQSv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Oct 2019 12:18:51 -0400
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF22521928;
        Wed, 16 Oct 2019 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571242731;
        bh=4COz89P1zpzTlupxFFQQGh+6woY2hW0X2gsI1bc8HjQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xwM3DTxgTRrC9GLPoyMIVyLVBPvVCnMIYci5oDwuIfmHMX1amrkAZRVTHxCv2wXtc
         iN9BRwPh3p5AIcva79D+7Ov7/Jet8aumvERgrxkZ9IfryBELEq9tQ6GTaGWHZTJSpO
         FvlLYzakgxBw3HbEL7engUbcO4kAnu7OK4vX8AWM=
Received: by mail-lj1-f179.google.com with SMTP id f5so24654496ljg.8;
        Wed, 16 Oct 2019 09:18:50 -0700 (PDT)
X-Gm-Message-State: APjAAAUXkIUHaNPy8woBVm4cfuX74uUpiYXDPfyGsVwW0S1FBSG+4VzZ
        +u4XqI6hBlrp9w9MbLWrOxzq4BnLLM1pfRUJkkg=
X-Google-Smtp-Source: APXvYqzu0RRV4q5pmM2b1sIMqFIXCTIwcolo7Dbv37lXTeqNkqpQA3nPxoPmIeAXJmVDW5spOsl8eEkJOiSX9IsOuoQ=
X-Received: by 2002:a2e:9ec2:: with SMTP id h2mr23068539ljk.85.1571242729071;
 Wed, 16 Oct 2019 09:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191002164316.14905-1-krzk@kernel.org> <20191002164316.14905-6-krzk@kernel.org>
 <20191014113240.GN12262@dragon>
In-Reply-To: <20191014113240.GN12262@dragon>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 16 Oct 2019 19:18:34 +0300
X-Gmail-Original-Message-ID: <CAJKOXPccVj3KJTzzxvQpzFeBYHX1onoh+DfApr8AA-QxvPzWLg@mail.gmail.com>
Message-ID: <CAJKOXPccVj3KJTzzxvQpzFeBYHX1onoh+DfApr8AA-QxvPzWLg@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] ARM: dts: imx: Rename "iram" node to "sram"
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 14 Oct 2019 at 14:33, Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Wed, Oct 02, 2019 at 06:43:12PM +0200, Krzysztof Kozlowski wrote:
> > The device node name should reflect generic class of a device so rename
> > the "iram" node to "sram".  This will be also in sync with upcoming DT
> > schema.  No functional change.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
>
> Let me know if you want it go through IMX tree.

Yes please, I think each of these should go through soc maintainers.

Best regards,
Krzysztof
