Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFD949AE80
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jan 2022 09:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1452847AbiAYIut (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jan 2022 03:50:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44734 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1452396AbiAYIsa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 Jan 2022 03:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643100504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yd1WKnJi4EmxzcHW+i/qeODwBDDbmaxTB6i9RVfgt68=;
        b=GtM/3CaPrWqoejTVX43k+SHZoj1G53TQ3uml+WKwrM/AXd0Ae882jKheC68IcFpW2rbZj1
        vGf9ZDaQTk/f7X/U92tU/Pq6I2KE2Ih/l/Rxk7QoMny4191k3VWtffQe1lGuob9bo4lLhC
        sPhZFdC7ev1qC4KS/ngXrkjaIIu0yTs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-Gj8HHAKkP5uWHToiMu5pUA-1; Tue, 25 Jan 2022 03:48:23 -0500
X-MC-Unique: Gj8HHAKkP5uWHToiMu5pUA-1
Received: by mail-lf1-f72.google.com with SMTP id m9-20020a194349000000b0043955e8f436so2223765lfj.11
        for <linux-omap@vger.kernel.org>; Tue, 25 Jan 2022 00:48:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=Yd1WKnJi4EmxzcHW+i/qeODwBDDbmaxTB6i9RVfgt68=;
        b=c027bnXx8CsoICdWpZIxBOyCG0eLnp7CutqN0xfV6QbVaCHV0bcaB3575n5PB0OCv6
         gPT1MBEJ0w+qOoHHMTCXVP+nppoHkblIenjwrdN1fY6Qk2MsEK2fTmY6agS4A3IJJeQO
         vl5ozpD/qpJLQnGwinjk8/uIWm91ihIV23tFOmZUTHVN16OV1mRMMCWFP8fuPqVhbdq/
         90PLKIC7YfW+neLILXnoqgdWnhveY3vB/vjcHJsBaTcYVkrCoz6TprL5DFK7tw4aDyER
         sqd7pm2q/MmsA509EbI7DBMvZ5oHYKAQ4DTEl6w+7tr2kszTPaqAmGnLh5pfUlta95xf
         H/eQ==
X-Gm-Message-State: AOAM531YMhOSoD3ZdovXHv/NRn5ZIv03BF1dpEhZuNVJftq9e/t+pJ09
        f6NE3z788DDOlj1pLVMlcV06tuYVLZ1bDeDC4dPu5+wJkFtLJJQ2EJsYaziEmyQlnNuKuQWAQ3F
        7M/T1BQ+LdNBfJQC3Sp1efA==
X-Received: by 2002:a05:6512:39d6:: with SMTP id k22mr2385514lfu.35.1643100501660;
        Tue, 25 Jan 2022 00:48:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxwhNy1HNpMVvfvDUzZxkJK+1ehL/C8lfabAZ+HI1KNAiOuuPTUUmJY8rF7+xKxcYp0DPCgQ==
X-Received: by 2002:a05:6512:39d6:: with SMTP id k22mr2385500lfu.35.1643100501474;
        Tue, 25 Jan 2022 00:48:21 -0800 (PST)
Received: from [192.168.0.50] (87-59-106-155-cable.dk.customer.tdc.net. [87.59.106.155])
        by smtp.gmail.com with ESMTPSA id w6sm1413865lfa.222.2022.01.25.00.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 00:48:20 -0800 (PST)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <db6e0da3-b78b-f302-fe71-d89d9ea7ad88@redhat.com>
Date:   Tue, 25 Jan 2022 09:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Cc:     brouer@redhat.com,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH net] net: cpsw: Properly initialise struct
 page_pool_params
Content-Language: en-US
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Murali Karicheri <m-karicheri2@ti.com>,
        "David S. Miller" <davem@davemloft.net>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
References: <20220124143531.361005-1-toke@redhat.com>
In-Reply-To: <20220124143531.361005-1-toke@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 24/01/2022 15.35, Toke Høiland-Jørgensen wrote:
> The cpsw driver didn't properly initialise the struct page_pool_params
> before calling page_pool_create(), which leads to crashes after the struct
> has been expanded with new parameters.
> 
> The second Fixes tag below is where the buggy code was introduced, but
> because the code was moved around this patch will only apply on top of the
> commit in the first Fixes tag.
> 
> Fixes: c5013ac1dd0e ("net: ethernet: ti: cpsw: move set of common functions in cpsw_priv")
> Fixes: 9ed4050c0d75 ("net: ethernet: ti: cpsw: add XDP support")
> Reported-by: Colin Foster <colin.foster@in-advantage.com>
> Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
> ---

Acked-by: Jesper Dangaard Brouer <brouer@redhat.com>

