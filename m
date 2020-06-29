Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E57220E873
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 00:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391930AbgF2WGx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 18:06:53 -0400
Received: from muru.com ([72.249.23.125]:59938 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgF2SfO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Jun 2020 14:35:14 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B266381B7;
        Mon, 29 Jun 2020 17:17:04 +0000 (UTC)
Date:   Mon, 29 Jun 2020 10:16:09 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        bcousson@baylibre.com, Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v2] arm: dts: am335x-pocketbeagle: add gpio-line-names
Message-ID: <20200629171609.GW37466@atomide.com>
References: <20200618182921.GA61509@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618182921.GA61509@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200618 11:30]:
> The BeagleBoard.org PocketBeagle has P1 and P2 headers [0] which expose
> many of the TI AM3358 SoC balls to stacking expansion boards called
> "capes", or to other external connections like jumper wires connected
> to a breadboard.

Thanks applying into omap-for-v5.9/dt.

Tony
