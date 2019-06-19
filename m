Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2078F4BA2D
	for <lists+linux-omap@lfdr.de>; Wed, 19 Jun 2019 15:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730858AbfFSNjW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Jun 2019 09:39:22 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41282 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730389AbfFSNjR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Jun 2019 09:39:17 -0400
Received: by mail-lj1-f196.google.com with SMTP id s21so3296340lji.8
        for <linux-omap@vger.kernel.org>; Wed, 19 Jun 2019 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2t3Yal+vwyuoBFiQTTodm3C95Pfj2mqPo4RiVmx+7jg=;
        b=nBMIHu+tJ2tVHdaevmd+TYbKCkTM0NzjTg8l+gMZbGSRw4N3p4uJBiSugoQLfSd78/
         49rsMxRSSxmiZuprrOA8SH/7MA3ObMyEfIgGDPOnUP/0DW/2aefDXU75iI56N7EgNGpi
         jT4+aa/xogPDHL/+RlIkvCi0bFxuoxODuBCMot2u3kTZDx8PwAYEuj157lW2111UoYh5
         vne9Aoc4uRSNchLEBHEVJdS4bbd9iaq18pQJrwBlXypdMeVzePCIu5cYvEl4zuQXkaob
         M56BO1AncRk2p+aJ8n1ZJKY4P6eTV5+qcQ+P9E896hh4HxNhmEJ+ieMt9CvpVCSzjoFe
         7hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2t3Yal+vwyuoBFiQTTodm3C95Pfj2mqPo4RiVmx+7jg=;
        b=ojtP7/yO5vQDug+rLmQqMSeOTKmuhmYwToLGPRFBT4S/QDCBcVEir8L4Zfi8gUQY9A
         UWbxjJHXY7rBCeXyvkT+ZoujHj99D48W8uEKd9aZhMlVkB7PoBQd4wFC+1f9XJbjssLk
         uXg0RMtl88xmjeSHrLBTO0MoP0sqIdgJsrEERL0HW8Fs9qlro5nARRNzriF88wMOez6q
         lKefN5yBURJj9Kkz9WRtuXO+yHelj36RLK1scr/EoxtbPPF7Z/BJAFalynCHhVC5Izzr
         wl5nwytm8kOAPAgNQKEDe9Ce67x+nBlIYRDCb50asKVzWKwegJvoyDIGIO6fVmHuSEYL
         3RZg==
X-Gm-Message-State: APjAAAV0LpmRv2mkgfPqlhHJ2EagkZerDSrTXZexXl8lSpnYQfML8nDC
        q/SHCCB6XHcIeMmIL178SE+bNg==
X-Google-Smtp-Source: APXvYqzRFp6YQNz/neGsZpbMwPaEEKZ8nB8asUsHtMaPb3sHnLFbq0jGzPfqJJl0hzB/qI+gCrQjBg==
X-Received: by 2002:a2e:85d7:: with SMTP id h23mr2370461ljj.53.1560951555576;
        Wed, 19 Jun 2019 06:39:15 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id m17sm3098220lji.16.2019.06.19.06.39.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 06:39:14 -0700 (PDT)
Date:   Wed, 19 Jun 2019 06:26:22 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/4] ti-sysc dts changes for v5.3
Message-ID: <20190619132622.njnberfpeerqinpr@localhost>
References: <pull-1560399818-512977@atomide.com>
 <pull-1560399818-512977@atomide.com-4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1560399818-512977@atomide.com-4>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jun 13, 2019 at 12:10:53AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit b6a53c4c872ab6870eb455d10a6f7ff0d99b1b1f:
> 
>   bus: ti-sysc: Detect uarts also on omap34xx (2019-05-28 05:19:17 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.3/ti-sysc-dt-signed
> 
> for you to fetch changes up to 22a7fc15cf1e742884fdc11a236fcd755225b4f0:
> 
>   ARM: dts: Drop legacy custom hwmods property for omap4 mmc (2019-05-28 05:19:17 -0700)

Merged, thanks!


-Olof
