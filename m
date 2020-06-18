Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E374C1FF9D4
	for <lists+linux-omap@lfdr.de>; Thu, 18 Jun 2020 19:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgFRRDt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Jun 2020 13:03:49 -0400
Received: from muru.com ([72.249.23.125]:58310 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728080AbgFRRDt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 18 Jun 2020 13:03:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CBD9480A9;
        Thu, 18 Jun 2020 17:04:40 +0000 (UTC)
Date:   Thu, 18 Jun 2020 10:03:45 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] arm: dts: am335x-pocketbeagle: add gpio-line-names
Message-ID: <20200618170345.GI37466@atomide.com>
References: <20200609142504.GA2955236@x1>
 <20200617170915.GA4185472@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617170915.GA4185472@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200617 17:10]:
> Tony - does this look ok for 5.9?

Yes looks OK to me.

Just wondering, are the line with "NA" not used internally either?
If the "NA" lines are used internally, we should probably use
"Reserved" or "Internal" or something like that to avoid later
on having to patch them with internal device names..

> If so, I might start making other variants like BeagleBone Blue and
> BeagleBone {Green,Black} Wireless and submit those when ready.

OK yeah makes sense.

Regards,

Tony
