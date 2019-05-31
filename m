Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93AEE31352
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2019 19:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfEaRDj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 May 2019 13:03:39 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38770 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfEaRDi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 May 2019 13:03:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id o13so10297822lji.5
        for <linux-omap@vger.kernel.org>; Fri, 31 May 2019 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=12NE3SfIinzJ7XpqIcOAQmDUQT+ji5jxyzGzgl5ENCE=;
        b=ZAxNlOFZnMCcNzG18eVml9J3A00DPwzUG5yNlZ1+oUPGn1QCv+xu31aYCjUxvUCr7F
         LlebMGET5VE+tiWmYMrdvu5vPSg4UP/cL0dxwaWz9otHxT8/3X5jNYcKz15saTmh5hRH
         rzkpQ6v0f4YOMH0DvxyeY2Yz6OI7uCOyke06EhXKR6C7snzNQuBluoNLCxPI1ag/LCsU
         kKNYQt1lhXah1mBM1qLGevmPp852B6wPMkrkJGc2Kbo+YTePWv30Kykaj0FDNDO+VeiK
         cuxlE3wOaFm6/ZjyYP65YS9c5QJAB1E9Gr/fULih10W47f6GJ2E62Xa4du0ghepAVE0h
         2BlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=12NE3SfIinzJ7XpqIcOAQmDUQT+ji5jxyzGzgl5ENCE=;
        b=OlerYl7+mirHlYNFTYbYY9ksQpApEX+bGYw7KhLAnDegKfx9/UB4G9mLcyYMvP8Vy6
         VviaJ017adkGIYxVG3stgmlhcXiLVCwJHPiAiyov2fwEyW/vyFu5fu+cbQ1S08/X4n4o
         qvt6TfzvE5z8Dq8EvUWJ/zffOE2HtkWjTBt9kf0A87LX9m2byLGKJjfb6JBRnQzNzK5s
         qt6neldAEl+sgpqJVCiO5xTq9Tc9Tgzqm7LqZ+nKCIpkRIRCUWxOSO4LlEcJzC+4aGn6
         lILwtT2f6JS5dQWk8y4WCPVxoOK74Zj7YE6NRJ+8P2A947Vojw+ldajIyGtErYo0HO7A
         EsMQ==
X-Gm-Message-State: APjAAAXFakINR+dZmG2KicRVLYgR6H008UykdQOjQAh/3bO6v25PTwJK
        wTCHFrcH4syyqXh5Xfxdcyz8Yw==
X-Google-Smtp-Source: APXvYqxiM6Yb4v9zWQUo+NRb0u7Je+0z62vA3uaeLDfgNn18powAkbdLqXE9+4keWug9YbtDy8hxmw==
X-Received: by 2002:a2e:9747:: with SMTP id f7mr6315783ljj.34.1559322216639;
        Fri, 31 May 2019 10:03:36 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id u7sm1300591ljj.51.2019.05.31.10.03.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2019 10:03:36 -0700 (PDT)
Date:   Fri, 31 May 2019 20:03:33 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net,
        ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com
Subject: Re: [PATCH v2 net-next 7/7] net: ethernet: ti: cpsw: add XDP support
Message-ID: <20190531170332.GB3694@khorivan>
Mail-Followup-To: Jesper Dangaard Brouer <brouer@redhat.com>,
        grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net,
        ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com
References: <20190530182039.4945-1-ivan.khoronzhuk@linaro.org>
 <20190530182039.4945-8-ivan.khoronzhuk@linaro.org>
 <20190531174643.4be8b27f@carbon>
 <20190531162523.GA3694@khorivan>
 <20190531183241.255293bc@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190531183241.255293bc@carbon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 31, 2019 at 06:32:41PM +0200, Jesper Dangaard Brouer wrote:
>
>On Fri, 31 May 2019 19:25:24 +0300 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> wrote:
>
>> On Fri, May 31, 2019 at 05:46:43PM +0200, Jesper Dangaard Brouer wrote:
>> >
>> >From below code snippets, it looks like you only allocated 1 page_pool
>> >and sharing it with several RX-queues, as I don't have the full context
>> >and don't know this driver, I might be wrong?
>> >
>> >To be clear, a page_pool object is needed per RX-queue, as it is
>> >accessing a small RX page cache (which protected by NAPI/softirq).
>>
>> There is one RX interrupt and one RX NAPI for all rx channels.
>
>So, what are you saying?
>
>You _are_ sharing the page_pool between several RX-channels, but it is
>safe because this hardware only have one RX interrupt + NAPI instance??

I can miss smth but in case of cpsw technically it means:
1) RX interrupts are disabled while NAPI is scheduled,
   not for particular CPU or channel, but at all, for whole cpsw module.
2) RX channels are handled one by one by priority.
3) After all of them handled and no more in budget - interrupts are enabled.
4) If page is returned to the pool, and it's within NAPI, no races as it's
   returned protected by softirq. If it's returned not in softirq it's protected 
   by producer lock of the ring.

Probably it's not good example for others how it should be used, not a big
problem to move it to separate pools.., even don't remember why I decided to
use shared pool, there was some more reasons... need search in history.

>
>-- 
>Best regards,
>  Jesper Dangaard Brouer
>  MSc.CS, Principal Kernel Engineer at Red Hat
>  LinkedIn: http://www.linkedin.com/in/brouer

-- 
Regards,
Ivan Khoronzhuk
