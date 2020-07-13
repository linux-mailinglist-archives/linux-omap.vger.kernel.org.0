Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAD521DF62
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jul 2020 20:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgGMSK3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 14:10:29 -0400
Received: from muru.com ([72.249.23.125]:36728 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729689AbgGMSK2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Jul 2020 14:10:28 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BD80F8106;
        Mon, 13 Jul 2020 18:10:25 +0000 (UTC)
Date:   Mon, 13 Jul 2020 11:10:25 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>, bcousson@baylibre.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ARM: dts: am335x-pocketbeagle: set default mux for
 gpio pins
Message-ID: <20200713181025.GP5849@atomide.com>
References: <20200712103717.1219765-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200712103717.1219765-1-drew@beagleboard.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200712 03:40]:
> These pins on the PocketBeagle P1 and P2 headers are connected to AM3358
> balls with gpio lines, and these pins are not used for any other
> peripherals by default. These GPIO lines are unclaimed and could be used
> by userspace program through the gpiod ABI.
> 
> This patch adds a "default" state in the am33xx_pinmux node and sets the
> mux for those pins to gpio (mode 7) and input enable.

Thanks applying into omap-for-v5.9/dt.

Tony
