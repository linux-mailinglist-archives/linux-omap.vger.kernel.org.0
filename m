Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35B01F8143
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2019 21:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbfKKUcX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 15:32:23 -0500
Received: from muru.com ([72.249.23.125]:41668 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726877AbfKKUcX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Nov 2019 15:32:23 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 838C38047;
        Mon, 11 Nov 2019 20:32:59 +0000 (UTC)
Date:   Mon, 11 Nov 2019 12:32:20 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: OMAP1: drop duplicated dependency on ARCH_OMAP1
Message-ID: <20191111203220.GX5610@atomide.com>
References: <20191111171034.28896-1-uwe@kleine-koenig.org>
 <20191111185101.GA27282@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191111185101.GA27282@darkstar.musicnaut.iki.fi>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Aaro Koskinen <aaro.koskinen@iki.fi> [191111 18:51]:
> Hi,
> 
> On Mon, Nov 11, 2019 at 06:10:34PM +0100, Uwe Kleine-König wrote:
> > All of arch/arm/mach-omap1/Kconfig is enclosed in a big "if ARCH_OMAP1"
> > and so every symbol already has a dependency on ARCH_OMAP1 even without
> > mentioning it in their list of dependencies.
> > 
> > Also dependencies on ARCH_OMAP can be dropped as it is selected by
> > ARCH_OMAP1.
> > 
> > Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Thanks applying into omap-for-5.5/omap1.

Regards,

Tony
