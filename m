Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B77249784
	for <lists+linux-omap@lfdr.de>; Wed, 19 Aug 2020 09:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgHSHco (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Aug 2020 03:32:44 -0400
Received: from muru.com ([72.249.23.125]:41042 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgHSHcn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Aug 2020 03:32:43 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 966C1807A;
        Wed, 19 Aug 2020 07:32:42 +0000 (UTC)
Date:   Wed, 19 Aug 2020 10:33:10 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, aford@beaconembedded.com,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] ARM: dts: omap3: Add cpu trips and cooling map for
 omap34/36 families
Message-ID: <20200819073310.GF2994@atomide.com>
References: <20200818125720.10424-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818125720.10424-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [200818 15:57]:
> Currently, OMAP3_THERMAL is disabled by default, so the bandgap sensor
> is unavailable, and enabling it will somewhat increase power consumption.
> However for boards which operate near their thermal limit, OMAP3_THERMAL
> can be enabled and monitored to keep the processor from either running
> too fast, or shutdown when it's deemed to be operating at an unsafe
> thermal limit at the expense of increased power consumption.
> 
> The OMAP3530, OMAP3630, and DM3730 all show thresholds of 90C and 105C
> depending on commercial or extended temperature ratings.
> 
> This patch expands the thermal information to include the limits of
> 80C for alert and 90C critical based on commercial temperature rating.
> It sets the coolings-cells for the 34xx and 36xx CPU's which will start
> to throttle back their maximum frequency when the bangap sensor reads
> above the alert temerature of 80C.

Thanks applying into omap-for-v5.10/dt.

Tony
