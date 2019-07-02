Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51BD65DAAE
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2019 03:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfGCBXL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Jul 2019 21:23:11 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42339 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbfGCBXJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Jul 2019 21:23:09 -0400
Received: by mail-wr1-f66.google.com with SMTP id x17so733475wrl.9
        for <linux-omap@vger.kernel.org>; Tue, 02 Jul 2019 18:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fhGTRRlj+oNnom0r7WG68ILJggF1tRmBA7+h0sn4aHU=;
        b=IB/bmny+VPQQLZytPAp+5HlEgrZmDlRBzsrQkNZkmYwxP+Id/yUjtNR6gi41a1xZN8
         KQ08p4BL1YUwktRg7FhzaPScp37YxM3uwccWRpIXREFG+ug4W9OOhcbIPXcqmnonvfxW
         zRnUgGLigs3lZNwvU5Ac75pLOaB2g/3mSEtTtUw2A4fGVcYEoS3ASY02IzU0lkkKaX9s
         i3uhBDPmdf0KEyOVHifWK6SplVNbcsWBxlsQBccac//U5XOrJuDq7J+6gdgm0eFMRRAT
         KQN+902e1pxKhH7dYkgpd+gcXtC8mknGpPrfLXUEUCk9FcDLKPo8s7AbPntAjOOgWlDN
         77Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fhGTRRlj+oNnom0r7WG68ILJggF1tRmBA7+h0sn4aHU=;
        b=rGgXDUMa1tml0WXT/gt5tIPB3hjCOrr3RGZC6tVqLvUuSgPaKUeE/BJnm+OkxqqIhx
         ADmZ/og7ejZoVBzMXDjYKP7rh2ieZp8Oah537xqJ+BewAjmOZ9NQBe6R37+Sj6vV+jkB
         kY2imPGWK0Q26YICBp1kRxN5j9ZmHxZWJaer1Ah1i/Ypag5JiOwBm5ll0HRkmdx+cT9u
         5c4XjFVJ9iQvDgSwpTmZFzdi8TwpA/zmJXvnG0OA2w9uJZrVvajnXO+TIHwzasBh9Waw
         f8tLGfCbMU7jDGCs7Nl6Ls7B39koN0EU+mwqvwHHphiCF3vEayVJkG/b09mmINS/FZ83
         biSw==
X-Gm-Message-State: APjAAAXtGH55DPdqiPhhGU7XfhY4x3hBtxwzyMIaDBDWkT+OYuF/3Bz1
        SniXFP7UcZHXGSCHoapmQ7kihMo5xL8=
X-Google-Smtp-Source: APXvYqyL0wJTez6TZyjeT/xmWOXzYmO/gmM5DGARc+Xg7zSTPeTSnEtY9Gfebk2z9iqEruXO8sLbdg==
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr2037078wrr.235.1562102140256;
        Tue, 02 Jul 2019 14:15:40 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
        by smtp.gmail.com with ESMTPSA id g14sm113417wro.11.2019.07.02.14.15.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 14:15:39 -0700 (PDT)
Date:   Wed, 3 Jul 2019 00:15:36 +0300
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        netdev@vger.kernel.org, grygorii.strashko@ti.com,
        jakub.kicinski@netronome.com, daniel@iogearbox.net,
        john.fastabend@gmail.com, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] net: core: page_pool: add user refcnt and reintroduce
 page_pool_destroy
Message-ID: <20190702211536.GA22618@apalos>
References: <20190702153902.0e42b0b2@carbon>
 <156207778364.29180.5111562317930943530.stgit@firesoul>
 <20190702144426.GD4510@khorivan>
 <20190702165230.6caa36e3@carbon>
 <20190702145612.GF4510@khorivan>
 <20190702171029.76c60538@carbon>
 <20190702152112.GG4510@khorivan>
 <20190702202907.15fb30ce@carbon>
 <20190702185839.GH4510@khorivan>
 <20190702230241.3be6d787@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702230241.3be6d787@carbon>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jesper,
Getting late here, i'll respond in detail tomorrow. One point though

[...]
> 
> This special use-case, seems confined to your driver. And Ilias told me
> that XDP is not really a performance benefit for this driver as the HW
> PPS-limit is hit before the XDP and netstack limit.  I ask, does it
> make sense to add XDP to this driver, if it complicates the code for
> everybody else?
I think yes. This is a widely used driver on TI embedded devices so having XDP 
to play along is a nice feature. It's also the first and only armv7 we have
supporting this. Ivan already found a couple of issues due to the 32-bit
architecture he is trying to fix, i think there's real benefit in having that,
performance aside.
I fully agree we should not impact the performance of the API to support a
special hardware though. I'll have a look on the 2 solutions tomorrow, but the
general approach on this one should be 'the simpler the better'

Cheers
/Ilias

> 
> -- 
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
