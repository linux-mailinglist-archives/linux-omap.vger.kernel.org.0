Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122EA38070C
	for <lists+linux-omap@lfdr.de>; Fri, 14 May 2021 12:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhENKVg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 May 2021 06:21:36 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:35527 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230063AbhENKVf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 May 2021 06:21:35 -0400
Received: from [37.162.158.223] (port=59602 helo=[192.168.43.3])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lhUvf-000Geb-4N; Fri, 14 May 2021 12:20:23 +0200
Subject: Re: Status of ti/ti-linux-5.10.y development
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Menon, Nishanth" <nm@ti.com>, "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
 <56825232-0920-f2c6-b4c7-cb488465d870@ti.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <9cb5a7d4-bf01-7079-8556-f6de008872c9@lucaceresoli.net>
Date:   Fri, 14 May 2021 12:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <56825232-0920-f2c6-b4c7-cb488465d870@ti.com>
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

Hi Grygorii,

On 14/05/21 12:14, Grygorii Strashko wrote:
> Hi
> 
> On 14/05/2021 11:30, Luca Ceresoli wrote:
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
>> BTW they are not present even in mainline Linux.
>>
>> Are this drivers still absent and in progress of being added to
>> ti/ti-linux-5.10.y, or are they present in a different form that I have
>> been unable to find?
>>
>> Assuming they still have to be added, is there an estimate timing for
>> their availability on the 5.10 branch?
>>
>> [0] git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
>>
> 
> 
> TI 5.10 migration is still work in progress.

Thanks for the feedback.

Any estimate of how long this is expected to take?

Is there any public list of drivers to be added and their status?

-- 
Luca
