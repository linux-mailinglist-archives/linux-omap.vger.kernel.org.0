Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5010626592C
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 08:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgIKGLJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 02:11:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:35406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgIKGLH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Sep 2020 02:11:07 -0400
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E62E0221F1;
        Fri, 11 Sep 2020 06:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599804667;
        bh=R+WQCRWfq/LEeLL9EuGAFD+jyfSl/fjliRW9gC2u17M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GHEpjzBiGvtJ1QhOXg4nIsgN5ThSgM00QRJX4Cghvz7A274L7p71V6OwfaBrG1X7J
         uVyd/7XdH7fhiQhYyOM4eLfnabBhEQ8cFOqAAgpYBXbjJTV7NJ8+LYLGYdNvk7hHE1
         8odlxiTb6JWeOThhbKMIc1HFWyofHRtn3Q8u/1v8=
Received: by mail-ej1-f48.google.com with SMTP id gr14so12244485ejb.1;
        Thu, 10 Sep 2020 23:11:06 -0700 (PDT)
X-Gm-Message-State: AOAM531kIgp6PQ41zD+x4poHXkcXDayMrLutW1ti6LgVzfaTLQazauxe
        d0ugZuDx+8NaAQ6H8+Yo1qMazkg61LxFFr414i8=
X-Google-Smtp-Source: ABdhPJysqYkgvsUB5GiEswkRNNKILHjjgWCeXRVo+QHtk0WCjK+abRX2rEGDEoOCLg/z/tM8wvqyn+iTq0H6F2DGVuc=
X-Received: by 2002:a17:906:af53:: with SMTP id ly19mr495830ejb.503.1599804665477;
 Thu, 10 Sep 2020 23:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org> <20200910175733.11046-13-krzk@kernel.org>
 <CACPK8XfmDySpkCw8nkmns-euGQE6JTqZLVO6JhvFJiRqNosRuQ@mail.gmail.com>
In-Reply-To: <CACPK8XfmDySpkCw8nkmns-euGQE6JTqZLVO6JhvFJiRqNosRuQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 11 Sep 2020 08:10:53 +0200
X-Gmail-Original-Message-ID: <CAJKOXPca3R=LYVws9rYj-iuOx7Z1GMkM2ow2pCQ3CGnv0vSS7Q@mail.gmail.com>
Message-ID: <CAJKOXPca3R=LYVws9rYj-iuOx7Z1GMkM2ow2pCQ3CGnv0vSS7Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] ARM: dts: aspeed: align GPIO hog names with dtschema
To:     Joel Stanley <joel@jms.id.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Guenter Roeck <linux@roeck-us.net>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 11 Sep 2020 at 02:58, Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 10 Sep 2020 at 17:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.
>
> This is a bit ugly. Do we have to go down this path?

No, but please comment on schema (1/15 in this series).

Best regards,
Krzysztof
