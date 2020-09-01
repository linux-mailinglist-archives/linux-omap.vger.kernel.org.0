Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B46258887
	for <lists+linux-omap@lfdr.de>; Tue,  1 Sep 2020 08:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgIAGwq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Tue, 1 Sep 2020 02:52:46 -0400
Received: from mail-ej1-f45.google.com ([209.85.218.45]:35324 "EHLO
        mail-ej1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgIAGwp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Sep 2020 02:52:45 -0400
Received: by mail-ej1-f45.google.com with SMTP id a26so111978ejc.2;
        Mon, 31 Aug 2020 23:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=NdI0i26I1m2JwhhrHaGH5V3jsM96zTjy9JrUvoOsAbI=;
        b=DTcG6mZUeiUxYeqgLprbegzdIlYK0txqMBdvrb79ELij3N9WY73mkiX2/psGeSQQAU
         1UsjlxOUbtLGC5PD9ICfFkNvanSHxiJPXqAZpIIlA5QFeDR2A1j3TuLcPVsUdh5PCKOP
         rYPNQVhTFRE/QtbtydtKN0p9Ww1P9fa5+zJF8hXBxSlOqSqCPiuuL6zbsC20Ns3cB6C1
         sQgUwbRFPopEza0X2rCB5kh/DP76vLFgMr03bxbQCF8DDvK4Ath3KEPEEElPDdfpIJIA
         LH83Y1CwBnY02nE0yD8WKHASdjBw15jR2VlTxEKs9pZhnwACqwKTDqlx7fQFNuCjYBSc
         qK3A==
X-Gm-Message-State: AOAM533zDhrrTAqiMFNzRSNrF9hyWTAjpYvYYU6KVi2vMu4yk2uh6/UW
        TbCm15EHT5RkikMT1+bQ6SUoSo4KF1A=
X-Google-Smtp-Source: ABdhPJxe2vElHRt1FCakFYjFOnN+zh0xZL8cfJNufhDKuPEHbTX9fbWGX82D2IszgTQEIJby4yTbIA==
X-Received: by 2002:a17:906:2b57:: with SMTP id b23mr222670ejg.26.1598943163775;
        Mon, 31 Aug 2020 23:52:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
        by smtp.googlemail.com with ESMTPSA id q11sm254347eds.16.2020.08.31.23.52.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 23:52:43 -0700 (PDT)
Date:   Tue, 1 Sep 2020 08:52:41 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     rogerq@ti.com, tony@atomide.com, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] memory: omap-gpmc: Fix -Wunused-function warnings
Message-ID: <20200901065241.GA7720@kozik-lap>
References: <20200901035642.22772-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200901035642.22772-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 01, 2020 at 11:56:42AM +0800, YueHaibing wrote:
> drivers/memory/omap-gpmc.c:987:12: warning: ‘gpmc_cs_remap’ defined but not used [-Wunused-function]
>  static int gpmc_cs_remap(int cs, u32 base)
>             ^~~~~~~~~~~~~
> drivers/memory/omap-gpmc.c:926:20: warning: ‘gpmc_cs_get_name’ defined but not used [-Wunused-function]
>  static const char *gpmc_cs_get_name(int cs)
>                     ^~~~~~~~~~~~~~~~
> drivers/memory/omap-gpmc.c:919:13: warning: ‘gpmc_cs_set_name’ defined but not used [-Wunused-function]
>  static void gpmc_cs_set_name(int cs, const char *name)
>              ^~~~~~~~~~~~~~~~
> Make them as  __maybe_unused to fix this.

Hi,

Do you know what configuration triggers these warnings? What has to be
disabled (e.g. CONFIG_OF)? Such information is useful in the commit
message.

Best regards,
Krzysztof
