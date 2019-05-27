Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01512BB75
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 22:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfE0Ulh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 16:41:37 -0400
Received: from emh03.mail.saunalahti.fi ([62.142.5.109]:33338 "EHLO
        emh03.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfE0Ulh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 May 2019 16:41:37 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-68-2-nat.elisa-mobile.fi [85.76.68.2])
        by emh03.mail.saunalahti.fi (Postfix) with ESMTP id D2E5140020;
        Mon, 27 May 2019 23:41:35 +0300 (EEST)
Date:   Mon, 27 May 2019 23:41:35 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>
Subject: Re: omap2plus_defconfig broken on ARMv6
Message-ID: <20190527204135.GA24195@darkstar.musicnaut.iki.fi>
References: <20190524220731.GB4597@t60.musicnaut.iki.fi>
 <20190527055746.GH5447@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527055746.GH5447@atomide.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Sun, May 26, 2019 at 10:57:46PM -0700, Tony Lindgren wrote:
> * Aaro Koskinen <aaro.koskinen@iki.fi> [190524 22:07]:
> > Noticed today that booting omap2plus_defconfig on N8x0 crashes
> > early. Disabling CONFIG_SMP makes it work.
> 
> OK. It sure used to work when I last tested but that's been quite
> a while now. Any ideas which commit caused the ldrexd regression?

No idea, I tried even 3.16 and even that seems to have the same issue
if multi v6/v7 and SMP is selected.

A.
