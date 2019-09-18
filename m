Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 919E7B600F
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 11:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfIRJYW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 05:24:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38977 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfIRJYW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Sep 2019 05:24:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id i1so3986185pfa.6
        for <linux-omap@vger.kernel.org>; Wed, 18 Sep 2019 02:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gxoSuJQ6tFLYp4g2neEbM8yU2CStuYNj11hMjYPafM0=;
        b=Fk/TzG+zR7aMVIWtTy+Yxf3cDDmJPfGy2lwVIWxXmfAmZzAlaACNEJbKJkPHu2ia2E
         YXjLa9LF9NBR2KfrMTDAoPx3l7enK+r001ZMoNtsxj1kPshqgLP0pLTeQ91lqKaiWCOu
         V/f2DW71FndaBt7uaP1SE0hsTLfZW+fEcvwj8mfYS6QqtidCeGNT5KvLVtkYTPKr4Qs/
         ffcOfOcI8t8FEOiuOA6DrqjMNMkLVJCn08H9tZymDF3iN3mVcWFUCL8c9UxfacKhBkiv
         GMv+kOMZ01UA2RSI/0DzJJtz25hxRKvTdbmOJORLhNCqUBnjcVqihD//gNsgoVXi5GAq
         axEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gxoSuJQ6tFLYp4g2neEbM8yU2CStuYNj11hMjYPafM0=;
        b=gaGc7WK1uAroo3Tm+gptixxBo1fwi4vEK7nSegvEZjIpKaBYkp4IsgcaMUY+RdgBHu
         9MGYMhLPEO/mhHr7jWyHI+BbZz4yetILc59zrcPZ/gWXJ2ntmxwVkeHa8iKUSu0BKHU+
         WQkGKltyVbJ17vzJXpBdMDBk3twNZNIVm099yO+4wIVvDa9IUpzjNTbGs9JcIMkbrqo1
         SBEZjgA5ut9SOGZKCIZP56TRQnBHhcZcf0BVkBA2yYwO9CY0Fh9Y4WuKcG5iZSfFll2+
         tYigOosadMDxx3yBqhLubVzzR+21b9KKuZRcsSdhJcaFQ8uAxak3JZ2jHpRLZ/gn2b2k
         mg9A==
X-Gm-Message-State: APjAAAVChRTP2LJSZ9KkzIUk3hbtnfG0ha85n34EganrtenZ8C8idPcy
        BUW5vX0TxmZGsiQDDCwNNcIdMQ==
X-Google-Smtp-Source: APXvYqz7Ynw9js8OL9E7HFrRlFKBtt+IpGnyik3APBXO5zcuV+d4IhN19kTq6wgZbJpIvoCMlNjK6Q==
X-Received: by 2002:aa7:8d81:: with SMTP id i1mr2935659pfr.191.1568798661686;
        Wed, 18 Sep 2019 02:24:21 -0700 (PDT)
Received: from localhost ([122.172.73.172])
        by smtp.gmail.com with ESMTPSA id t8sm3523628pjq.30.2019.09.18.02.24.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 02:24:20 -0700 (PDT)
Date:   Wed, 18 Sep 2019 14:54:18 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        =?iso-8859-1?Q?Andr=E9?= Roth <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>, Adam Ford <adam.ford@logicpd.com>
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
Message-ID: <20190918092418.que4c5jpcn2dcavx@vireshk-mac-ubuntu>
References: <20190912183037.18449-1-aford173@gmail.com>
 <51bb8890-bfd7-c241-1ce5-151df3a90513@linaro.org>
 <CAHCN7xKjwkJHysSkNymF=sw6KuS=FqbapuRFZODuj6E_hmRG1A@mail.gmail.com>
 <2ef812a4-2f2d-b2e2-9fa4-080775e24bc8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ef812a4-2f2d-b2e2-9fa4-080775e24bc8@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 13-09-19, 00:33, Daniel Lezcano wrote:
> 
> Hi Adam,
> 
> On 12/09/2019 23:19, Adam Ford wrote:
> > On Thu, Sep 12, 2019 at 4:12 PM Daniel Lezcano
> > <daniel.lezcano@linaro.org> wrote:
> >>
> >> On 12/09/2019 20:30, Adam Ford wrote:
> >>> The thermal sensor in the omap3 family isn't accurate, but it's
> >>> better than nothing.  The various OPP's enabled for the omap3630
> >>> support up to OPP1G, however the datasheet for the DM3730 states
> >>> that OPP130 and OPP1G are not available above TJ of 90C.
> >>>
> >>> This patch configures the thermal throttling to limit the
> >>> operating points of the omap3630 to Only OPP50 and OPP100 if
> >>> the thermal sensor reads a value above 90C.
> 
> Oh, that's a very interesting use case.
> 
> AFAICT the thermal framework is not designed to deal with this
> situation. I agree this setup may work (even if I'm not convinced about
> the stability of the whole).
> 
> May be Viresh can help for the cpufreq side?

Sorry but I am not able to understand what's not supported by thermal framework
here and what can I do to help :)

-- 
viresh
