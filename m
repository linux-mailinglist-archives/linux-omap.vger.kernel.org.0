Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A015D2696
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 11:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387444AbfJJJqU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 05:46:20 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33897 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJJqT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 05:46:19 -0400
Received: by mail-lf1-f68.google.com with SMTP id r22so3888212lfm.1
        for <linux-omap@vger.kernel.org>; Thu, 10 Oct 2019 02:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bOdUK43Zrcy1lhdGUvr7gHEY+dXMKmUM4nmu90Y2f+c=;
        b=gvDcj/9wS7zUthQwZcOQjvZwZ3WvWYnnDTqnt2kSt3H9DciIDd9NqaPswho21Ddl7I
         WvDmIf6K+PbYtYoMzQCNDJsbSPdYdFIuglvbQmKSmbLd4MMiNnPR/CZ5rUlzkyFqEjB0
         T0cNSMKu64sZXjA6hTpDDcqEoZSRlAa1hjSE74edYxVTSrZPg9W51m5KvelCpvxVh0C7
         BjVvRdET7/5As5Xupa4uypPJ0Tam8mjpeDE9SYVfmgU60MjmRbde9rIxGA3itLh/rxg4
         /RJauBDlDHrlHeeGPrn/958QN2DBZdQpytthQPX/6ZshPU6Z7FrDwCo+DQtOT+Y3ziOD
         Yezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bOdUK43Zrcy1lhdGUvr7gHEY+dXMKmUM4nmu90Y2f+c=;
        b=BnD58KVFsNUbPW2Xsly+eauPxVi20bjcMXetDGMjWhNTkI6VDjK2F8m2M5lCrQxRCS
         dnWXuT8s6SsJtHxH/QIlJnzpzZN/0wFU0DtehgvgZRymf1c38Rdw4Mm86obOlkIEhpkr
         /d+6W1fIS+dMptu1uMvdKDMKKkmPispwdnjo3wUOJsZsmFu5v7tmbzwiLgaxevibTfAB
         weMrueejLJw6hlTpSyTV9IR0t4lNEQCPVxNqDRDrhTsryfZZA1niHoVbt2RhpWwfMaMR
         FOg/oI4xr8PX1LNNYrW5Ml12cihmtiIy6ih9iha7PFTyJYfuHH0gtJH8R/ob+3Eo8bk5
         XTEA==
X-Gm-Message-State: APjAAAWIo5JzSvTsYt8GeV4s/QQY+j4HYtd/nUrwn0G4qpmaCCrqvr81
        sT0Znr+Xnew+luaUOdBa61iiLg==
X-Google-Smtp-Source: APXvYqyBWFl1azLNF7at8ri4SEKUVxOAAwDePEodVifnraMZZOADy1J9AMWpoLiEgVrbwk/RqU6WVA==
X-Received: by 2002:a19:4a13:: with SMTP id x19mr5713606lfa.184.1570700776286;
        Thu, 10 Oct 2019 02:46:16 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8a1:87e7:7d41:872a:af43:22d? ([2a00:1fa0:8a1:87e7:7d41:872a:af43:22d])
        by smtp.gmail.com with ESMTPSA id q124sm1087772ljb.28.2019.10.10.02.46.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 02:46:15 -0700 (PDT)
Subject: Re: [PATCH 2/7] usb: musb: omap2430: Wait on enable to avoid babble
To:     Tony Lindgren <tony@atomide.com>, Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
References: <20191009212145.28495-1-tony@atomide.com>
 <20191009212145.28495-3-tony@atomide.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d3693c4d-bf22-ce0a-cfc8-f2e55bb0c257@cogentembedded.com>
Date:   Thu, 10 Oct 2019 12:46:02 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009212145.28495-3-tony@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello!

On 10.10.2019 0:21, Tony Lindgren wrote:

> We can babble interrupt if we attempt to switch to USB host mode too
         ^ verb missing?

> soon after enabling musb. Let's fix the issue by waiting a bit in
> runtime_resume.
> 
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Marcel Partap <mpartap@gmx.net>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Michael Scott <hashcode0f@gmail.com>
> Cc: NeKit <nekit1000@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
[...]

MBR, Sergei
