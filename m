Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCD14867C1
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jan 2022 17:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241301AbiAFQgd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 Jan 2022 11:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiAFQgc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 6 Jan 2022 11:36:32 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9172C061245
        for <linux-omap@vger.kernel.org>; Thu,  6 Jan 2022 08:36:31 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id w16so11508505edc.11
        for <linux-omap@vger.kernel.org>; Thu, 06 Jan 2022 08:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M1A3LACj+j0Hgad3kGJ9PHcu3VF2UWaJkDObZItByPc=;
        b=gBmuklLNJwjahR1Z3raHUZhJGzZrnlRkARi6wR1Lp6WbHD62SIHrmWjYooOSbacOuk
         Y8GE1YUtBpbYskjEMt5lTpRYrgrP4gHL/StgdsGLNfJijV7DlGP1CuB761Mr38Dhw3Kg
         tHn287dtBQC+k/YKKsYQVK7oOqHhJCT4eN0PXDZLtP9zUd9wfoyWd4dztkFl3HQJP5dF
         yYEfyA+ZRCct1dutYeh7A+lqKIbQCY5GqN+xjF1d9+Hbd5PdEVRsSptzzG1goaODb2H/
         T93xboDXIlhfZmXKxEROZ+p9KopUMDENZNO8sKmBCnR9h5glqE6QdUtpjsz3ioWQXWoi
         PgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M1A3LACj+j0Hgad3kGJ9PHcu3VF2UWaJkDObZItByPc=;
        b=BG8AGHEPhn95M7Toyyb0dq2tgdAqYnZo8BmUnRjmQoxBu6FS75r/ggeeryoXPEyWAs
         OPBcW08wTfDrFu4gxIom5ofOr9KvsiFZ/Eu93v+PKuOucZ5dRl3RwwK4+d8yuHuVYzG4
         4x3mkJLypE+SV4SllbpSBIDtfSIyiA92XvglT1LhUaG74qk9pUlqm6LbRdIjRIAKZkUv
         6W71cbO/oY4c3M4WNgrP7fnGFAuOmhcPeYuXq7KyB2V6rCbgxAa7wjTvrDIUFmBvLdBL
         mF1FwirJ74ZEefbJPslU7pI/n9X8/y8Mqj/Gl0XMjwsD/bL/f38l38gSZfuC7RoBkqiH
         SE9g==
X-Gm-Message-State: AOAM5324R+EZBfWSC91OLQuuZb1VKMzafGhFkCiNhZieMHiyye2eg4N2
        rxfiIzEh/Vwt6zkhdILn3u4=
X-Google-Smtp-Source: ABdhPJzdYu1D3ka7U8E7JFwbNhSV2N/Rd7GKIDaveRyj3ZFsBb3UVH87ry+whkdKeFMK5GBuVWTJVg==
X-Received: by 2002:a17:907:33d0:: with SMTP id zk16mr46258216ejb.165.1641486990448;
        Thu, 06 Jan 2022 08:36:30 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id hc14sm608626ejc.42.2022.01.06.08.36.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jan 2022 08:36:29 -0800 (PST)
Subject: Re: Nokia N900 increased power draw with panel-sony-acx565akm loaded
 v5.9 and v5.10
To:     Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Dev Null <devnull@uvos.xyz>, Pavel Machek <pavel@ucw.cz>,
        Tony Lindgren <tony@atomide.com>
References: <001a77db-80c0-d000-3d78-b9b301669826@wizzup.org>
 <20211213131023.ese6lrkayj4qopfa@earth.universe>
 <968dbb4a-3944-7226-d686-379a442be7ef@wizzup.org>
 <e8766733-baba-72e8-5638-f7b02fab2601@wizzup.org>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <7af4acb7-f239-137d-3c4b-2ab92ebeaeb0@gmail.com>
Date:   Thu, 6 Jan 2022 18:36:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e8766733-baba-72e8-5638-f7b02fab2601@wizzup.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 6.01.22 г. 14:53 ч., Merlijn Wajer wrote:
> Hi Sebastian,
> 
> On 16/12/2021 14:06, Merlijn Wajer wrote:
>> Hi Sebastian,
>>
>> [...]
>>
>> With this additional patch applied the device seems to idle at lower
>> power usage in the test environment I described in my previous email.
>> That is, it idles at at 42mW with the panel probed, as opposed to 60mW
>> with the panel probed. I also just booted to my Maemo Leste environment
>> and the panel still comes up fine and seems to behave fine.
>>
>> Is there additional testing I can perform to make sure this patch is the
>> right one?
> 
> Just an update, Ivaylo is seeing some problems with this patch, so we
> might have to dig in deeper later on. I'll keep the patch around, but it
> shouldn't be merged at this point in time.
> 

Basically, the problems I see is a black screen :) - the same as without 
7c4bada12d320 (though I didn't test if blank/unblank will make it work). 
I may look into fremantle kernel to see what Nokia did.

Regards,
Ivo
