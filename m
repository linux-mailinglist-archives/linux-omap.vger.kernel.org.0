Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D27F1CE950
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 18:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfJGQeI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 12:34:08 -0400
Received: from muru.com ([72.249.23.125]:35666 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727801AbfJGQeI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 12:34:08 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5653C80A5;
        Mon,  7 Oct 2019 16:34:41 +0000 (UTC)
Date:   Mon, 7 Oct 2019 09:34:04 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Michael Allwright <allsey87@gmail.com>
Cc:     Michael Allwright <michael.allwright@upb.de>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, Tero Kristo <t-kristo@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH RFC] DT support for omap4-iss
Message-ID: <20191007163404.GZ5607@atomide.com>
References: <CALcgO_6UXp-Xqwim8WpLXz7XWAEpejipR7JNQc0TdH0ETL4JYQ@mail.gmail.com>
 <20190628110441.42gdqidkg5csuxai@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628110441.42gdqidkg5csuxai@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Sakari Ailus <sakari.ailus@iki.fi> [190628 11:05]:
> Hi Michael,
> 
> On Mon, Aug 10, 2015 at 05:16:30PM +0200, Michael Allwright wrote:
> > Hi All,
> > 
> > The following PRELIMINARY patch adds DT support to the OMAP4 ISS. It
> > also fixes some problems a have found along the way. It is tightly
> > modelled after the omap3-isp media platform driver. This patch is a
> > work in progress as I would like feedback. It contains debugging
> > messages that need to be removed, as well as disgusting abuses of the
> > C language as required (i.e. clk_core_fake and clk_fake).
> 
> We'd like to restart the effort adding DT support for this driver. Would
> you be able to, if not address the comments, at least resend your old patch
> with your Signed-off-by: line so we could make use of what you've already
> done?

I think this email no longer works for Michael? Adding another
one from commit at [0] below.

Michael, care to email that patch to the lists with your
Signed-off-by so Sakari can use it? Or at least reply with
your Signed-off-by to this thread :)

Regards,

Tony

[0] https://github.com/allsey87/meta-builderbot/blob/master/recipes-kernel/linux/linux-stable-4.16/0008-omap4iss-Fix-multiple-bugs-and-use-device-tree.patch
