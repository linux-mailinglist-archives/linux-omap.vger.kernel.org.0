Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E502A1234BC
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 19:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbfLQSX5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 13:23:57 -0500
Received: from muru.com ([72.249.23.125]:49024 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726646AbfLQSX4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 17 Dec 2019 13:23:56 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0DD098116;
        Tue, 17 Dec 2019 18:24:35 +0000 (UTC)
Date:   Tue, 17 Dec 2019 10:23:53 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/3] AM57xx: Fix bugs in device tree files
Message-ID: <20191217182353.GC35479@atomide.com>
References: <20191217085124.22480-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217085124.22480-1-kishon@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Kishon Vijay Abraham I <kishon@ti.com> [191217 00:50]:
> This series
>  *) Removes gpio property from endpoint device tree node (since it's
>     used for driving PERST# line)
>  *) Fix gpio used for driving PERST# line in AM571x IDK
>  *) Model 5V0 regulator which is used for deriving the regulator
>     connected to COMQ port in beagle x15

Thanks applying all into fixes.

Tony
