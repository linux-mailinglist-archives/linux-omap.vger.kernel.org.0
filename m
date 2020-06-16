Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AD61FB8C7
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 17:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731558AbgFPP6z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 11:58:55 -0400
Received: from muru.com ([72.249.23.125]:58010 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733220AbgFPP6y (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Jun 2020 11:58:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A82588123;
        Tue, 16 Jun 2020 15:59:46 +0000 (UTC)
Date:   Tue, 16 Jun 2020 08:58:52 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: fix irq setup
Message-ID: <20200616155852.GB37466@atomide.com>
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

Hmm so is this one still pending?

Best that Arnd applies it directly:

Acked-by: Tony Lindgren <tony@atomide.com>
