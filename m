Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4C4090D8A
	for <lists+linux-omap@lfdr.de>; Sat, 17 Aug 2019 08:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbfHQGzP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Aug 2019 02:55:15 -0400
Received: from muru.com ([72.249.23.125]:58042 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbfHQGzP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 17 Aug 2019 02:55:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B8811812D;
        Sat, 17 Aug 2019 06:55:41 +0000 (UTC)
Date:   Fri, 16 Aug 2019 23:55:10 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>,
        Dan Williams <dan.j.williams@intel.com>,
        Lars Melin <larsm17@gmail.com>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv2] USB: serial: option: Add Motorola modem UARTs
Message-ID: <20190817065510.GH52127@atomide.com>
References: <20190815082602.51765-1-tony@atomide.com>
 <20190815112737.GD32300@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815112737.GD32300@localhost>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Johan Hovold <johan@kernel.org> [190815 11:28]:
> On Thu, Aug 15, 2019 at 01:26:02AM -0700, Tony Lindgren wrote:
> > Tested-by: Pavel Machek <pavel@ucw.cz>
> > Signed-off-by: Tony Lingren <tony@atomide.com>
> 
> I fixed up the typo in your name here, which checkpatch caught.

Oopsie :)

> > Changes since v1:
> > - Leave out defines as suggested by Lars
> 
> Thanks, Tony. Now applied.

Thanks,

Tony
