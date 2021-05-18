Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1725D387109
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 07:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241302AbhERFOU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 01:14:20 -0400
Received: from muru.com ([72.249.23.125]:56902 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236877AbhERFOU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 May 2021 01:14:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1A84480BA;
        Tue, 18 May 2021 05:13:05 +0000 (UTC)
Date:   Tue, 18 May 2021 08:12:58 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Andreas Kemnade <andreas@kemnade.info>, linux-omap@vger.kernel.org
Subject: Re: Status of ti/ti-linux-5.10.y development
Message-ID: <YKNM2jJTMqNBfVLt@atomide.com>
References: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
 <20210515154758.5b1b4fc5@aktux>
 <7879604b-467f-7363-8294-7164238032d0@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7879604b-467f-7363-8294-7164238032d0@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Luca Ceresoli <luca@lucaceresoli.net> [210517 08:43]:
> Actually I still haven't tackled HDMI on ti-linux-5.10.y, I only found
> it by comparing the .config from the working 4.19 branch and from 5.10
> and noticed the config option has disappeared.
> 
> My current problem is that omapdrm does not populate /dev/fb0 (perhaps
> due to a similar reason) and the VIP driver apparently just not present
> on the 5.10.y branch.

Well HDMI should be working, at least it was when I last tested with
omap2plus_defconfig. Maybe you're missing CONFIG_FB=y ?

No idea about VIP driver though.

Regaqrds,

Tony
