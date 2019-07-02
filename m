Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19DC25D232
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jul 2019 16:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfGBO4S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Jul 2019 10:56:18 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36426 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbfGBO4R (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Jul 2019 10:56:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so17230860ljj.3
        for <linux-omap@vger.kernel.org>; Tue, 02 Jul 2019 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7rK7qDKEwGgygAo6exJfMYowjRvJTz2OfqB0lXA6Pfg=;
        b=PCN9X2D/JW/E7t0T4zSJTdmG1LASGkY2AXb3iTdWBl644wY1XW1wMWZx2DP2Z/7KHI
         3FJIpNnyGXhQsq+k3+NYCBfzwP9WdvqY75RlPTDw4pbqNOD/6m8H3qw/qg0N18SQ/wPt
         4c4uLlo1rPSeaYy0OMQOej73UvqLzO8XZcxw5AYlPCAfA6XdXD25Or/zz8kahtocP9k1
         HP6k/DoZ2d5hSz4DPGbHfR7v85tgbjBOzfay3uzxZnKkWtBdzfzfn1GjSUTwNq4YXCRj
         FEh7jnHkPs4vr0tyZ+XMoXSHKnN/Cf8+zUif3+xZqPp/bBUyCM7u5iwhWe6jUlRv/UeN
         Wf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=7rK7qDKEwGgygAo6exJfMYowjRvJTz2OfqB0lXA6Pfg=;
        b=kJUKNMDXnzp4S/tBfxWJijwJ5v0qyuiH7XSR5zo1ybiL7mcGmzQ/Atb/t+6pOH86PV
         E+Bqg9Z3VzIyn4PETppPV3EXXUkjEg7exF97851eYBKdahZDYUYmsf8pB7QkLt5q1Vbs
         3Rbe9MZqNHJliSSNWSch+uZPov4Gnk4dSKnQsfBq+Ggj1UjgQzg9AS6tzzkHW/rl3XkH
         ZQ0VoQZWdYVWioc2D47Z1x+RoE16fVSdFB8G+R3imSn2bSMyv+2S7HL//G8PpQ9JIleJ
         WW2Im4TnHyRzV7eq2Kt2J5gO4/Lo4+bwa3ZWjTUZkm68t1XFbWqF2HFD6p3n7qmP6ABB
         pAOA==
X-Gm-Message-State: APjAAAW+lR83xDnP/FE2u0emdDDoKi4tJFxpPiZhg9RQiVGiQvQIJd/R
        698i+ByYI8899vrjdOMqzTGTvA==
X-Google-Smtp-Source: APXvYqxOMQT0G6y7V2pn2t8I+DIDfhNyZFaiJCq4TFQLkjR1uetJemhwCrBPg9N3EDdg7uo1Fm1J1w==
X-Received: by 2002:a2e:5302:: with SMTP id h2mr17005806ljb.47.1562079375922;
        Tue, 02 Jul 2019 07:56:15 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id v202sm241305lfa.28.2019.07.02.07.56.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 07:56:15 -0700 (PDT)
Date:   Tue, 2 Jul 2019 17:56:13 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     netdev@vger.kernel.org,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        grygorii.strashko@ti.com, jakub.kicinski@netronome.com,
        daniel@iogearbox.net, john.fastabend@gmail.com, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] net: core: page_pool: add user refcnt and reintroduce
 page_pool_destroy
Message-ID: <20190702145612.GF4510@khorivan>
Mail-Followup-To: Jesper Dangaard Brouer <brouer@redhat.com>,
        netdev@vger.kernel.org,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        grygorii.strashko@ti.com, jakub.kicinski@netronome.com,
        daniel@iogearbox.net, john.fastabend@gmail.com, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20190702153902.0e42b0b2@carbon>
 <156207778364.29180.5111562317930943530.stgit@firesoul>
 <20190702144426.GD4510@khorivan>
 <20190702165230.6caa36e3@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190702165230.6caa36e3@carbon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jul 02, 2019 at 04:52:30PM +0200, Jesper Dangaard Brouer wrote:
>On Tue, 2 Jul 2019 17:44:27 +0300
>Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> wrote:
>
>> On Tue, Jul 02, 2019 at 04:31:39PM +0200, Jesper Dangaard Brouer wrote:
>> >From: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
>> >
>> >Jesper recently removed page_pool_destroy() (from driver invocation) and
>> >moved shutdown and free of page_pool into xdp_rxq_info_unreg(), in-order to
>> >handle in-flight packets/pages. This created an asymmetry in drivers
>> >create/destroy pairs.
>> >
>> >This patch add page_pool user refcnt and reintroduce page_pool_destroy.
>> >This serves two purposes, (1) simplify drivers error handling as driver now
>> >drivers always calls page_pool_destroy() and don't need to track if
>> >xdp_rxq_info_reg_mem_model() was unsuccessful. (2) allow special cases
>> >where a single RX-queue (with a single page_pool) provides packets for two
>> >net_device'es, and thus needs to register the same page_pool twice with two
>> >xdp_rxq_info structures.
>>
>> As I tend to use xdp level patch there is no more reason to mention (2) case
>> here. XDP patch serves it better and can prevent not only obj deletion but also
>> pool flush, so, this one patch I could better leave only for (1) case.
>
>I don't understand what you are saying.
>
>Do you approve this patch, or do you reject this patch?
>
It's not reject, it's proposition to use both, XDP and page pool patches,
each having its goal.

-- 
Regards,
Ivan Khoronzhuk
