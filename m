Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED529B88E
	for <lists+linux-omap@lfdr.de>; Sat, 24 Aug 2019 00:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406246AbfHWW1C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Aug 2019 18:27:02 -0400
Received: from muru.com ([72.249.23.125]:58496 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405013AbfHWW1C (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 23 Aug 2019 18:27:02 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 807B980A5;
        Fri, 23 Aug 2019 22:27:30 +0000 (UTC)
Date:   Fri, 23 Aug 2019 15:26:58 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] ARM: dts: Configure rstctrl reset for SGX on AM3517
Message-ID: <20190823222658.GQ52127@atomide.com>
References: <20190821125502.32187-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821125502.32187-1-aford173@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190821 12:55]:
> Based on Tony Lindgren's work for omap34xx, this patch applies the same
> functionality to the AM3517.
> 
> The following can be tested via sysfs with the following to ensure the SGX
> module gets enabled and disabled properly:
> 
> 0x00010201
> 
> Bus error

OK thanks for doing that.

> Note that this patch depends on the PRM rstctrl driver that has
> been recently posted. If the child device driver(s) need to prevent
> rstctrl reset on PM runtime suspend, the drivers need to increase
> the usecount for the shared rstctrl reset that can be mapped also
> for the child device(s) or accessed via dev->parent.

Care to check the subject and description again.. I don't think
this one uses rstctrl resets :)

Regards,

Tony
