Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E66109C32
	for <lists+linux-omap@lfdr.de>; Tue, 26 Nov 2019 11:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbfKZKUY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Nov 2019 05:20:24 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45286 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbfKZKUX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Nov 2019 05:20:23 -0500
Received: by mail-lf1-f65.google.com with SMTP id 203so13573005lfa.12
        for <linux-omap@vger.kernel.org>; Tue, 26 Nov 2019 02:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ChYvUy7nbzcgIu7b9dxeLMQIJjXFL/MLGcvEByCUBfk=;
        b=MqA5yRt0Gk+lmlIxKjOOULMu/9ZtN8m9usKmEF+F+GPQkMqaSPqqvz8H4X1YCL9qAy
         nTAHxHoOlQ1FomuTmQlaV/tVkFqdA7AEHFZPByam+rK184VzjJHmNAD6AzscdSJJio3e
         ujoHiR8/Yhy0Z/QNgrUcwCw1GyGL2vnPnfiboU5aG5z0dFzS5i/sJiLnOKWX5fcpJcIC
         +tZV0VT7bnQpYhHUVisniUEwb9tK61/qSFjNdz2sZFpxh/C+gFJ68Ahk1/dxDWxePKS+
         zF4eVBQiMkUtlPa49gtnx80G6Vy845ZJM1Ny13fLN5h9ZDsEEAHNrtGbc0yKxoviDV2n
         qmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ChYvUy7nbzcgIu7b9dxeLMQIJjXFL/MLGcvEByCUBfk=;
        b=O2fHcvT8VZOoqOEkewjWyYc6AgDjnGsxDpWtE8XTm4zbLQZW0ZLUyftRmAGCgfKGQp
         t8UYpPvSJetwjsfVupX+htZugjFq+9xJE2tKT2YHXE8PmbkeBp49oj2qDToO9UoN7xjz
         EiZjk+ZhNLlyY2jXmErXlvBK+bOLQdaJ8OUPSTg1VnXBR84SlVxsWoG0hkH+cvzl8jhD
         SCd1YFiVhysSdtMRXBP8g54EOkdWbVG0VRnH8E1yXWFxIZ/Hy8Qvtteu6pM3ju4jUF90
         GQnPPvagibqIWwgDbK1OPi5aDR9IgXTGThL9WE+FNkE5q1AfmunfdWobag4h715zWrEn
         hKCw==
X-Gm-Message-State: APjAAAURnUCvIsHf8rPWrQ95S92Q+5UChuBtOdLvqiCWgkVydhLtHBwS
        LH9JEZ9HCqRIyRPE5YCYRPRcH98w72yP9g==
X-Google-Smtp-Source: APXvYqw8mwnV7wwV6Lyx7oysG/OMutGRX/5oA/M9u1SpeZw/nXXbkDy8s6u4UyUB1R/YACPnBORTLw==
X-Received: by 2002:ac2:5de4:: with SMTP id z4mr22539075lfq.17.1574763619758;
        Tue, 26 Nov 2019 02:20:19 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:276:286b:1836:c57b:99c6:5ea7? ([2a00:1fa0:276:286b:1836:c57b:99c6:5ea7])
        by smtp.gmail.com with ESMTPSA id y21sm5264762ljm.25.2019.11.26.02.20.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Nov 2019 02:20:19 -0800 (PST)
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
To:     Tony Lindgren <tony@atomide.com>, Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
References: <20191126034151.38154-1-tony@atomide.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5ae7f3aa-3992-a810-f5d4-0b5bb8fa6356@cogentembedded.com>
Date:   Tue, 26 Nov 2019 13:20:12 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126034151.38154-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello!

On 26.11.2019 6:41, Tony Lindgren wrote:

> When disconnected as USB B-device, we sometimes get a suspend interrupt
> after disconnect interrupt. In that case we have devctl set to 99 with
> VBUS still valid and musb_pm_runtime_check_session() wrongly things we

     Thinks?

> have an active session. We have no other interrupts after disconnect
> coming in this case at least with the omap2430 glue.
> 
> Let's fix the issue by checking the interrupt status again with
> delayed work for the devctl 99 case. In the suspend after disconnect
> case the devctl session bit has cleared by then and musb can idle.
> For a typical USB B-device connect case we just continue with normal
> interrupts.
> 
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
[...]

MBR, Sergei
