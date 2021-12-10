Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3006A470BD1
	for <lists+linux-omap@lfdr.de>; Fri, 10 Dec 2021 21:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239297AbhLJU2h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Dec 2021 15:28:37 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43522 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236530AbhLJU2g (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Dec 2021 15:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=LmeohJJFqmSg8dahQg673If8/qfGV9jsfx/DYhJ9PQw=; b=i7OpLzVGb3zd+ZVM79F888JleG
        UxEb4jDDrl+RPIMG7R9NT7RDVsODpoBh3ARr3W/E8IGqcC45Q4fAwFA3nqR4py+TevCvgQ3HHncPE
        zrG/E5ItAD3wK8NcZOuzIKlX+0GDg2sr9KtyKy3jaLPY18GjDfbDaCNvF/HZIZ1F9cL7ynOVAqkrb
        zCp/+0Ds+W9szSyUZzL3zG4pSQEvs0Xjy5RTYLfJCxQQcwTR8U1axD6WJ8PlRT3BfQ60p16x57/d/
        hvQafjn7bVc0n908Hu/2ADpGZqMQKh6CwRP/9QX5O39mYEK3NKzy7/5AUjMl4YbJX2z7Fm76jt1Sg
        OvwydD6g==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mvmRm-0000ja-R1; Fri, 10 Dec 2021 20:24:50 +0000
Subject: Re: Nokia N900 increased power draw with panel-sony-acx565akm loaded
 v5.9 and v5.10
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>, Pavel Machek <pavel@ucw.cz>,
        Tony Lindgren <tony@atomide.com>
References: <001a77db-80c0-d000-3d78-b9b301669826@wizzup.org>
 <20211210205945.747b2f97@aktux>
From:   Merlijn Wajer <merlijn@wizzup.org>
Message-ID: <9fcbdb66-4183-7431-267b-d0836b6b8cc6@wizzup.org>
Date:   Fri, 10 Dec 2021 21:30:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211210205945.747b2f97@aktux>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Andreas,

On 10/12/2021 20:59, Andreas Kemnade wrote:
> Hi,
> 
> On Fri, 10 Dec 2021 20:18:35 +0100
> Merlijn Wajer <merlijn@wizzup.org> wrote:
> 
> [...]
>> * 21b2cec61c04bd175f0860d9411a472d5a0e7ba1 (mmc: Set
>> PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4)
>>
> just for the records, I have a fix for that commit which also went into
> stable, so this is not an additional contruction site:
> 
> commit ec76c2eea903947202098090bbe07a739b5246e9
> Author: Andreas Kemnade <andreas@kemnade.info>
> Date:   Fri Dec 4 10:55:39 2020 +0100
> 
>     ARM: OMAP2+: omap_device: fix idling of devices during probe

Right - thanks, I was aware of this commit, but for bisect purposes I
decided to just revert offending commits because they weren't relevant
(or so I think at least) to the problem I was trying to debug. So I
wasn't able to use a stable branch for bisecting because the first thing
the bisect would do was throw out the stable fixes.

Regards,
Merlijn
