Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 516FA18067F
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 19:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgCJScn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 14:32:43 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54517 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgCJScn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Mar 2020 14:32:43 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 624BEC000A;
        Tue, 10 Mar 2020 18:32:41 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 09/14] mtd: rawnand: ams-delta: Handle more GPIO pins as optional
Date:   Tue, 10 Mar 2020 19:32:40 +0100
Message-Id: <20200310183240.19339-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212003929.6682-10-jmkrzyszt@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: ea5ea9fa6db23ff5b194e84fad32e3bae5c7f357
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 2020-02-12 at 00:39:24 UTC, Janusz Krzysztofik wrote:
> In order to make the driver more useful on platforms other than Amstrad
> Delta, allow GPIO descriptor pointers of possibly non-critical NWP and
> NCE pins to be initialised as NULL.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
