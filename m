Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9824A3A3D4D
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 09:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhFKHiT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 03:38:19 -0400
Received: from muru.com ([72.249.23.125]:41844 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230188AbhFKHiT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Jun 2021 03:38:19 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E8742813E;
        Fri, 11 Jun 2021 07:36:28 +0000 (UTC)
Date:   Fri, 11 Jun 2021 10:36:17 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Aswath Govindraju <a-govindraju@ti.com>
Cc:     Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Uri Mashiach <uri.mashiach@compulab.co.il>,
        Raag Jadav <raagjadav@gmail.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm: am335x/am437x: Fix ti,pindir-d0-out-d1-in
 property to boolean
Message-ID: <YMMScdxfmBVFpOL2@atomide.com>
References: <20210608050952.14204-1-a-govindraju@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608050952.14204-1-a-govindraju@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Aswath Govindraju <a-govindraju@ti.com> [210608 08:10]:
> The following series of patches fix "ti,pindir-d0-out-d1-in" property to
> boolean.

Thanks applying into omap-for-v5.14/dt.

Tony
