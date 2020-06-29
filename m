Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3765320DC9D
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jun 2020 22:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730613AbgF2URH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 16:17:07 -0400
Received: from muru.com ([72.249.23.125]:59968 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729266AbgF2TaK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Jun 2020 15:30:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 710FC81A7;
        Mon, 29 Jun 2020 17:04:53 +0000 (UTC)
Date:   Mon, 29 Jun 2020 10:03:58 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: am335x-pocketbeagle: set default mux for
 gpio pins
Message-ID: <20200629170358.GT37466@atomide.com>
References: <20200628152442.322593-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200628152442.322593-1-drew@beagleboard.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Drew Fustini <drew@beagleboard.org> [200628 08:26]:
> v2 changes:
> - change default mux from output to input.  Input is safer as it does
>   not drive the line.  If the user wants output, they will need to edit
>   this device tree.

So can you please clarify this a bit, are you saying that gpio output can't
be done via userspace?

Needing to change the dts does not sound good to me.. But maybe you mean
this is needed until the gpio-omap and pinctrl-single patches are merged?

Regards,

Tony
