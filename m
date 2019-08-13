Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89C428B583
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 12:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfHMK0M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 06:26:12 -0400
Received: from muru.com ([72.249.23.125]:57106 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727416AbfHMK0L (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 13 Aug 2019 06:26:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5C791805C;
        Tue, 13 Aug 2019 10:26:39 +0000 (UTC)
Date:   Tue, 13 Aug 2019 03:26:08 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH for v5.3] ARM: OMAP1: ams-delta-fiq: Fix missing irq_ack
Message-ID: <20190813102608.GK52127@atomide.com>
References: <20190811084802.630-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190811084802.630-1-jmkrzyszt@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Janusz Krzysztofik <jmkrzyszt@gmail.com> [190811 01:48]:
> Non-serio path of Amstrad Delta FIQ deferred handler depended on
> irq_ack() method provided by OMAP GPIO driver.  That method has been
> removed by commit 693de831c6e5 ("gpio: omap: remove irq_ack method").
> Remove useless code from the deferred handler and reimplement the
> missing operation inside the base FIQ handler.
> 
> Should another dependency - irq_unmask() - be ever removed from the OMAP
> GPIO driver, WARN once if missing.

Thanks applying into fixes.

Tony
