Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47A9C5FC46
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2019 19:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfGDRL7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Jul 2019 13:11:59 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39183 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbfGDRL7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Jul 2019 13:11:59 -0400
Received: by mail-lf1-f67.google.com with SMTP id v85so1725475lfa.6
        for <linux-omap@vger.kernel.org>; Thu, 04 Jul 2019 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CTw8LgIZLrVf0RNEYgPzuF2QYpEPgzEFcRlidCnudh0=;
        b=HuH/JsuO8405NViujKhNY1PieKnPq4PjbXEVCQ8+n9tCjMRS8m7dARScFiDdFYh3k8
         n32TRp7u0m6z3B0D9FzZ2syCVdiokCbih6m/OLiRNp/yIxKjzN9OoRbwwvyX4acKfZ0a
         HiR74sR6doIrqFfn15vn/I7sCL+1WNOGHamtMsZpL4+x80kHV63tLlnZhnCVz1yKiYdt
         JwoXpYR/t9TGopxvLD9dXbWfd1Y3kfx/ZltscCN7A6jCa3yiAZfHo6lStppWvT8UbzjI
         YAjvVwLHFfOqGwE9KnRSjpbwTrjMjNB6bUSqQx3zlUXk30JToslEQ9jX8eIx8jlyYSkY
         Pp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=CTw8LgIZLrVf0RNEYgPzuF2QYpEPgzEFcRlidCnudh0=;
        b=c6sGBFTBUYF/GGqU4x2dUl4av5Cwv59+SMRCD8J9REEXozcERx3KzkvqU11glqb2YQ
         h2x5A0VNoYb8whfBGv02jJttNVSdw+9Tr9jBHDrTXrZaKEHVNmucn6bf9Cz/6G2YilTa
         4COtNcoru2GDfbP6urTnLcUY6mzf9AQM6q7hfhSXwXM7eH3qh2tsyxJssHxiz5KrZm0l
         mZ/b0mHlXx52eJELyJoHzldst3fHPjUvjaCOcRv10STMy3cTGs3R9o6NET4iYim9CRLH
         61sR8gvHacJJPxjtDafNyrmzG/8UoYJRU3EbdqQ8XYIeO+p2d3jK6mt3joi0NI3UReOE
         pEvQ==
X-Gm-Message-State: APjAAAWTlHfLjVKx8AIFG4fVpczZejfDDIlgWbnuQTBW3b3Z1q4Ersl9
        0ABZg8bpBkD0X4MYTnxuU9yrfA==
X-Google-Smtp-Source: APXvYqwC1GwtWVldB9WJdDmz7RXuTaX/Qg+aRxyVkDoNEMfG5HVm/l90xvLZWEUL8tSpzufWb3TkNw==
X-Received: by 2002:ac2:5442:: with SMTP id d2mr1501791lfn.70.1562260316525;
        Thu, 04 Jul 2019 10:11:56 -0700 (PDT)
Received: from khorivan ([46.211.38.218])
        by smtp.gmail.com with ESMTPSA id w21sm669798lfl.84.2019.07.04.10.11.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 10:11:56 -0700 (PDT)
Date:   Thu, 4 Jul 2019 20:11:41 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     grygorii.strashko@ti.com, davem@davemloft.net, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        xdp-newbies@vger.kernel.org, ilias.apalodimas@linaro.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com
Subject: Re: [PATCH v6 net-next 1/5] xdp: allow same allocator usage
Message-ID: <20190704171135.GB2923@khorivan>
Mail-Followup-To: Jesper Dangaard Brouer <brouer@redhat.com>,
        grygorii.strashko@ti.com, davem@davemloft.net, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        xdp-newbies@vger.kernel.org, ilias.apalodimas@linaro.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com
References: <20190703101903.8411-1-ivan.khoronzhuk@linaro.org>
 <20190703101903.8411-2-ivan.khoronzhuk@linaro.org>
 <20190703194013.02842e42@carbon>
 <20190704102239.GA3406@khorivan>
 <20190704144144.5edd18eb@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190704144144.5edd18eb@carbon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 04, 2019 at 02:41:44PM +0200, Jesper Dangaard Brouer wrote:
>On Thu, 4 Jul 2019 13:22:40 +0300
>Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> wrote:
>
>> On Wed, Jul 03, 2019 at 07:40:13PM +0200, Jesper Dangaard Brouer wrote:
>> >On Wed,  3 Jul 2019 13:18:59 +0300
>> >Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> wrote:
>> >
>> >> First of all, it is an absolute requirement that each RX-queue have
>> >> their own page_pool object/allocator. And this change is intendant
>> >> to handle special case, where a single RX-queue can receive packets
>> >> from two different net_devices.
>> >>
>> >> In order to protect against using same allocator for 2 different rx
>> >> queues, add queue_index to xdp_mem_allocator to catch the obvious
>> >> mistake where queue_index mismatch, as proposed by Jesper Dangaard
>> >> Brouer.
>> >>
>> >> Adding this on xdp allocator level allows drivers with such dependency
>> >> change the allocators w/o modifications.
>> >>
>> >> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
>> >> ---
>> >>  include/net/xdp_priv.h |  2 ++
>> >>  net/core/xdp.c         | 55 ++++++++++++++++++++++++++++++++++++++++++
>> >>  2 files changed, 57 insertions(+)
>> >>
>> >> diff --git a/include/net/xdp_priv.h b/include/net/xdp_priv.h
>> >> index 6a8cba6ea79a..9858a4057842 100644
>> >> --- a/include/net/xdp_priv.h
>> >> +++ b/include/net/xdp_priv.h
>> >> @@ -18,6 +18,8 @@ struct xdp_mem_allocator {
>> >>  	struct rcu_head rcu;
>> >>  	struct delayed_work defer_wq;
>> >>  	unsigned long defer_warn;
>> >> +	unsigned long refcnt;
>> >> +	u32 queue_index;
>> >>  };
>> >
>> >I don't like this approach, because I think we need to extend struct
>> >xdp_mem_allocator with a net_device pointer, for doing dev_hold(), to
>> >correctly handle lifetime issues. (As I tried to explain previously).
>> >This will be much harder after this change, which is why I proposed the
>> >other patch.
>> My concern comes not from zero also.
>> It's partly continuation of not answered questions from here:
>> https://lwn.net/ml/netdev/20190625122822.GC6485@khorivan/
>>
>> "For me it's important to know only if it means that alloc.count is
>> freed at first call of __mem_id_disconnect() while shutdown.
>> The workqueue for the rest is connected only with ring cache protected
>> by ring lock and not supposed that alloc.count can be changed while
>> workqueue tries to shutdonwn the pool."
>
>Yes.  The alloc.count is only freed on first call.  I considered
>changing the shutdown API, to have two shutdown calls, where the call
>used from the work-queue will not have the loop emptying alloc.count,
>but instead have a WARN_ON(alloc.count), as it MUST be empty (once is
>code running from work-queue).
>
>> So patch you propose to leave works only because of luck, because fast
>> cache is cleared before workqueue is scheduled and no races between two
>> workqueues for fast cache later. I'm not really against this patch, but
>> I have to try smth better.
>
>It is not "luck".  It does the correct thing as we never enter the
>while loop in __page_pool_request_shutdown() from a work-queue, but it
>is not obvious from the code.  The not-so-nice thing is that two
>work-queue shutdowns will be racing with each-other, in the multi
>netdev use-case, but access to the ptr_ring is safe/locked.

So, having this, and being prudent to generic code changes, lets roll back
to idea from v.4:
https://lkml.org/lkml/2019/6/25/996
but use changes from following patch, reintroducing page destroy:
https://www.spinics.net/lists/netdev/msg583145.html
with appropriate small modifications for cpsw.

In case of some issue connected with it (not supposed), or two/more
allocators used by cpsw, or one more driver having such multi ndev
capabilities (supposed), would be nice to use this link as reference
and it can be base for similar modifications.

Unless Jesper disagrees with this ofc.

I will send v7 soon after verification is completed.

-- 
Regards,
Ivan Khoronzhuk
