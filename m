Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF52838821F
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 23:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhERVaW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 17:30:22 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:43500 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236860AbhERVaV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 May 2021 17:30:21 -0400
Received: from [77.244.183.192] (port=62972 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lj7Gv-0003Wx-Im; Tue, 18 May 2021 23:29:01 +0200
Subject: Re: Status of ti/ti-linux-5.10.y development
To:     Tony Lindgren <tony@atomide.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>, linux-omap@vger.kernel.org
References: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
 <20210515154758.5b1b4fc5@aktux>
 <7879604b-467f-7363-8294-7164238032d0@lucaceresoli.net>
 <YKNM2jJTMqNBfVLt@atomide.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <033e1cda-1889-eda1-06a4-222999c7bdc7@lucaceresoli.net>
Date:   Tue, 18 May 2021 23:29:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKNM2jJTMqNBfVLt@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 18/05/21 07:12, Tony Lindgren wrote:
> * Luca Ceresoli <luca@lucaceresoli.net> [210517 08:43]:
>> Actually I still haven't tackled HDMI on ti-linux-5.10.y, I only found
>> it by comparing the .config from the working 4.19 branch and from 5.10
>> and noticed the config option has disappeared.
>>
>> My current problem is that omapdrm does not populate /dev/fb0 (perhaps
>> due to a similar reason) and the VIP driver apparently just not present
>> on the 5.10.y branch.
> 
> Well HDMI should be working, at least it was when I last tested with
> omap2plus_defconfig. Maybe you're missing CONFIG_FB=y ?

Thanks for the hints!

CONFIG_FB is y, so it must be something else. Maybe I have to update my
DT? I'll check that when I resume working on the 5.10 branch.

-- 
Luca
