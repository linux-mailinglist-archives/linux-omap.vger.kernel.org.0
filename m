Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E18318068A
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 19:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgCJSdJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 14:33:09 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:40685 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgCJSdJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Mar 2020 14:33:09 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9AF4820002;
        Tue, 10 Mar 2020 18:33:05 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 05/14] mtd: rawnand: ams-delta: Enable OF partition info support
Date:   Tue, 10 Mar 2020 19:33:05 +0100
Message-Id: <20200310183305.19588-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212003929.6682-6-jmkrzyszt@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 2cef3d4cf4498e260f5bc2d5fab850e4a52be382
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 2020-02-12 at 00:39:20 UTC, Janusz Krzysztofik wrote:
> Provide MTD layer with device OF node info required by OF partition
> parser.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
