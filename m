Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD7046FF95
	for <lists+linux-omap@lfdr.de>; Fri, 10 Dec 2021 12:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237559AbhLJLRZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Dec 2021 06:17:25 -0500
Received: from fgw22-4.mail.saunalahti.fi ([62.142.5.109]:33519 "EHLO
        fgw22-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233117AbhLJLRY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Dec 2021 06:17:24 -0500
Received: from darkstar.musicnaut.iki.fi (85-76-101-4-nat.elisa-mobile.fi [85.76.101.4])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 3df9c624-59aa-11ec-ae1c-005056bdf889;
        Fri, 10 Dec 2021 13:13:47 +0200 (EET)
Date:   Fri, 10 Dec 2021 13:13:45 +0200
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     "Merlijn B.W. Wajer" <merlijn@archive.org>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Oops while booting 5.15.2 on Nokia N900
Message-ID: <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
References: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
 <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
 <c75ac850-7d9b-6263-a046-57c8f4435090@archive.org>
 <f463d8f2-109e-3040-4350-ce20d651ffe6@archive.org>
 <20211208205700.GA12125@duo.ucw.cz>
 <20211208220400.1f9cff00@aktux>
 <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Wed, Dec 08, 2021 at 11:34:53PM +0100, Merlijn B.W. Wajer wrote:
> What I have seen is that if off mode is enabled from userspace
> (debugfs), it does not cause a problem (or I don't hit the problem at
> least). That said, my off mode tests are pretty minimal with
> init=/bin/sh, and I haven't gotten a fully booted (with lots of modules
> loaded, gui and daemons) system to enter off mode yet.

I also started seeing crashes with fb2c599f0566 on N900. It's been several
months since I last tested, but I remember I was able to trigger the
crashes reliably with MMC access from the minimal shell enviroment.
I see the MMC is also visible in your crash logs. My test case was
something like "sleep 30 ; blkid ; sleep 30".

A.
