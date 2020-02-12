Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4337315AB5D
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 15:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbgBLOv7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Feb 2020 09:51:59 -0500
Received: from muru.com ([72.249.23.125]:54910 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727101AbgBLOv5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 12 Feb 2020 09:51:57 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 276DF80F6;
        Wed, 12 Feb 2020 14:52:41 +0000 (UTC)
Date:   Wed, 12 Feb 2020 06:51:54 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 03/14] ARM: OMAP1: ams-delta: Provide board specific
 partition info
Message-ID: <20200212145154.GK64767@atomide.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
 <20200212003929.6682-4-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212003929.6682-4-jmkrzyszt@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Janusz Krzysztofik <jmkrzyszt@gmail.com> [200212 00:41]:
> Now as the Amstrad Delta NAND driver supports fetching information on
> MTD partitions from device platform data, add partition info to the
> NAND device configuration.

Fine if you want hardcoded partition info :) Not sure if the partition
info coming from bootloader is any better either.. Ideally there would
be a partition table somewhere on the device like we have for disks..

Anyways, this is best merged together with the mtd patches so:

Acked-by: Tony Lindgren <tony@atomide.com>
