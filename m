Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF7F1C5BAA
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 17:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgEEPkB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 11:40:01 -0400
Received: from muru.com ([72.249.23.125]:52872 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729317AbgEEPkA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 May 2020 11:40:00 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E842080A5;
        Tue,  5 May 2020 15:40:48 +0000 (UTC)
Date:   Tue, 5 May 2020 08:39:57 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: fix irq setup
Message-ID: <20200505153957.GK37466@atomide.com>
References: <20200505141400.767312-1-arnd@arndb.de>
 <20200505143017.GA5263@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505143017.GA5263@afzalpc>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* afzal mohammed <afzal.mohd.ma@gmail.com> [200505 14:31]:
> Hi,
> 
> On Tue, May 05, 2020 at 04:13:48PM +0200, Arnd Bergmann wrote:
> 
> > A recent cleanup introduced a bug on any omap1 machine that has
> > no wakeup IRQ, i.e. omap15xx:
> 
> > Move this code into a separate function to deal with it cleanly.
> > 
> > Fixes: b75ca5217743 ("ARM: OMAP: replace setup_irq() by request_irq()")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Sorry for the mistake and thanks for the fix,
> 
> Acked-by: afzal mohammed <afzal.mohd.ma@gmail.com>

Acked-by: Tony Lindgren <tony@atomide.com>
