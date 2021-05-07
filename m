Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4375A376622
	for <lists+linux-omap@lfdr.de>; Fri,  7 May 2021 15:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236752AbhEGN1n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 May 2021 09:27:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60322 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhEGN1l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 May 2021 09:27:41 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CDA3EF;
        Fri,  7 May 2021 15:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620394000;
        bh=Y4ZVCz504AX3zFCTILayJKZwb9oWengQbtFqgQe03Ks=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=g4cMR6R+Vzrds2ZDhFTz8PI5fkdtNX98/tJzBPmCIAECKyDC3Pulm6aWC6aZ5M+Ze
         Y/Uaj0Zehit+f1HZn9nFk7DmxYIG2E4tFqQB7+YP+tDSGHc5WlRx4IisQhzSdcwbdh
         q185JnEk+E54ws9an2BIWpA+B50D296UqUbTJnUQ=
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
To:     Tony Lindgren <tony@atomide.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
References: <20210428092500.23521-1-tony@atomide.com>
 <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com> <YIo6CzsU4JRvAdpb@atomide.com>
 <79bea9b8-b2d2-11ec-87a3-34626347e122@ideasonboard.com>
 <YI/UXqQbvdtC2HqI@atomide.com> <YI/bdLkwtUNFKHyW@atomide.com>
 <YI/p9Trr5tphov6q@atomide.com> <YJJ9twsxdw2Mi0F6@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e2181257-4714-e306-1ba8-6b8c9d09807c@ideasonboard.com>
Date:   Fri, 7 May 2021 16:26:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJJ9twsxdw2Mi0F6@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/05/2021 14:12, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [210503 12:18]:
>> I think we still fix the dispc related issue too, otherwise the parent
>> child_count will just keep increasing on each suspend. I check that
>> again though.
> 
> After tons more debugging, I found the root cause for the parent child_count
> increasing and posted a patch for it at [0] below.
> 
> This means the $subject patch here can be done later on as clean-up to
> leave out lots of unnecessary PM runtime calls and simplify the system
> suspend :)

Great work, thanks! It's always nice when someone else does the tons of 
debugging ;).

I tested the patch you sent, works fine for me.

While testing I noticed another problem, which happens also without your 
fix: go to suspend with HDMI connected, remove the cable, resume the 
board -> boom. I didn't debug that yet.

  Tomi
