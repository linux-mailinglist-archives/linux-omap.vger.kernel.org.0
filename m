Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C378E382734
	for <lists+linux-omap@lfdr.de>; Mon, 17 May 2021 10:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235198AbhEQIlS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 May 2021 04:41:18 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:45917 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233224AbhEQIlR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 May 2021 04:41:17 -0400
Received: from [77.244.183.192] (port=64166 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1liYnA-00024v-BG; Mon, 17 May 2021 10:40:00 +0200
Subject: Re: Status of ti/ti-linux-5.10.y development
To:     Nishanth Menon <nm@ti.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
 <56825232-0920-f2c6-b4c7-cb488465d870@ti.com>
 <9cb5a7d4-bf01-7079-8556-f6de008872c9@lucaceresoli.net>
 <20210514153810.qv2kjdoy2ku2ss5d@unlearned>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <81167765-0e74-03f9-0878-dd07edf5e126@lucaceresoli.net>
Date:   Mon, 17 May 2021 10:39:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514153810.qv2kjdoy2ku2ss5d@unlearned>
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

Hi Nishanth,

On 14/05/21 17:38, Nishanth Menon wrote:
> Luca,
> On 12:20-20210514, Luca Ceresoli wrote:
>> Hi Grygorii,
>>
>> On 14/05/21 12:14, Grygorii Strashko wrote:
>>> Hi
>>>
>>> On 14/05/2021 11:30, Luca Ceresoli wrote:
>>>> Hi,
>>>>
>>>> I hope this is the proper place for this question. If it isn't: my
>>>> apologies, and I'd be glad to be redirected where appropriate.
>>>>
>>>> I currently have a prototype board based on AM5728 that is mostly
>>>> working, using branch ti/ti-linux-4.19.y of the TI kernel [0].
>>>>
>>>> Now I need some non-TI-specific kernel features that appeared in
>>>> mainline 5.10, so I tried to move to branch ti/ti-linux-5.10.y. But many
>>>> components that I am using on the 4.19 branch seem absent on the 5.10
>>>> branch, including VIDEO_TI_VIP, DRM_OMAP_WB and DRM_OMAP_CONNECTOR_HDMI.
>>>>
>>>> BTW they are not present even in mainline Linux.
>>>>
>>>> Are this drivers still absent and in progress of being added to
>>>> ti/ti-linux-5.10.y, or are they present in a different form that I have
>>>> been unable to find?
>>>>
>>>> Assuming they still have to be added, is there an estimate timing for
>>>> their availability on the 5.10 branch?
>>>>
>>>> [0] git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
>>>>
>>>
>>>
>>> TI 5.10 migration is still work in progress.
>>
>> Thanks for the feedback.
>>
>> Any estimate of how long this is expected to take?
> 
> Nothing we will be able to share in a public forum :(
> 
>>
>> Is there any public list of drivers to be added and their status?
> 
> In public, No - Note: even though the git repo is public, and
> internally we attempt to follow the same upstream rules, at the end,
> it is still a vendor kernel :(. But, rest assure that internally, we
> know precisely where we are and we are tracking towards completion.
> 
> While linux-omap is a public list, it might be better to answer
> vendor kernel questions in the context of e2e.ti.com (The TI forums
> - there are folks closely monitoring those and actively engaging
> to help customers out and will be better positioned to answer your
> specific queries). Do feel free to reach out to me on irc freenode.net
> #linux-omap etc if you'd need anything specific to help with.
> 
> We usually prefer linux-omap mailing list to stick with upstream
> discussions, one off vendor kernel discussions do take place from time
> to time, however, most of our TI support folks are better equipped to
> answer questions on TI forums.
> 
> 
> The above "officialdom statement" said, we do actively encourage our
> community (which we include ourselves and TI customers as well) to
> participate in making upstream kernel complete and point out anything
> we may have overlooked (yep, we are human) so that overall what vendor
> kernel does or does'nt do should be inconsequential in the longer term
> for the community and products derived from community.

Thanks for taking time to provide extra explanations! I'll  be using the
channels you suggested for more specific questions.

IIRC many years ago there used to be a web page for the OMAP 3530 (on
some TI wiki?) listing SoC devices and their driver status, with a green
"OK" for implemented drivers, yellow for work in progress or similar. It
was very useful to know from the beginning whether a driver was supposed
to exist and work on a given branch, to avoid grepping and searching to
even know whether it exists. It would be great to have something like
that these days. My 2c...

-- 
Luca
