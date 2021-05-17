Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2CC382741
	for <lists+linux-omap@lfdr.de>; Mon, 17 May 2021 10:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbhEQIoc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 May 2021 04:44:32 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:59664 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230312AbhEQIoc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 May 2021 04:44:32 -0400
Received: from [77.244.183.192] (port=64176 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1liYqJ-0003ow-GZ; Mon, 17 May 2021 10:43:15 +0200
Subject: Re: Status of ti/ti-linux-5.10.y development
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     linux-omap@vger.kernel.org
References: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
 <20210515154758.5b1b4fc5@aktux>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <7879604b-467f-7363-8294-7164238032d0@lucaceresoli.net>
Date:   Mon, 17 May 2021 10:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210515154758.5b1b4fc5@aktux>
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

Hi Andreas,

On 15/05/21 15:47, Andreas Kemnade wrote:
> Hi,
> 
> On Fri, 14 May 2021 10:30:50 +0200
> Luca Ceresoli <luca@lucaceresoli.net> wrote:
> 
>> Hi,
>>
>> I hope this is the proper place for this question. If it isn't: my
>> apologies, and I'd be glad to be redirected where appropriate.
>>
>> I currently have a prototype board based on AM5728 that is mostly
>> working, using branch ti/ti-linux-4.19.y of the TI kernel [0].
>>
>> Now I need some non-TI-specific kernel features that appeared in
>> mainline 5.10, so I tried to move to branch ti/ti-linux-5.10.y. But many
>> components that I am using on the 4.19 branch seem absent on the 5.10
>> branch, including VIDEO_TI_VIP, DRM_OMAP_WB and DRM_OMAP_CONNECTOR_HDMI.
>>
> Wasn't the DRM_OMAP_CONNECTOR_HDMI replaced with something generic when
> also omapdrm started to use the generic panel support, was it? So HDMI
> connectors should work with mainline.

Thanks for the heads up.

Actually I still haven't tackled HDMI on ti-linux-5.10.y, I only found
it by comparing the .config from the working 4.19 branch and from 5.10
and noticed the config option has disappeared.

My current problem is that omapdrm does not populate /dev/fb0 (perhaps
due to a similar reason) and the VIP driver apparently just not present
on the 5.10.y branch.

Regards,
-- 
Luca
