Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 792B14BA28
	for <lists+linux-omap@lfdr.de>; Wed, 19 Jun 2019 15:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730404AbfFSNjQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Jun 2019 09:39:16 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39643 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730389AbfFSNjP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Jun 2019 09:39:15 -0400
Received: by mail-lj1-f195.google.com with SMTP id v18so3299503ljh.6
        for <linux-omap@vger.kernel.org>; Wed, 19 Jun 2019 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I8Nrwj4ElZXBcf5FVzV3Tn26XcGAm+m+0urFxFQjV6U=;
        b=N0wVLI3jKk4wObXwz8cGz+NvM5k9FfBKEJGf2fNZDS9Juh5qYLFbZZ+7lPUw6YRIze
         mbrYkXj5x7m0+q2W4L0/oJFqtsuETgjfmQbQDnszyH5WzhPOhj1RLZ3LPwS6TRyYD9EG
         mEB3QJb+hALovKwsDjoHPja1+dZ0Yy/fa4AMgmZtOnSrByejKpa1i8hDlhIx8BGVN8BU
         W6gtnle9d1Czq7W/jiNq3W3nIPle3u6x1GHTVksOFl1+SoC5e7Odg0KnuYXiGyR+WfAA
         gleCahfGsWUuLOPJhxVzEyuUeoa/635yMuILmCB547Uf/zjeQEw0nlzH+6viwTZUqFgQ
         8eDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I8Nrwj4ElZXBcf5FVzV3Tn26XcGAm+m+0urFxFQjV6U=;
        b=m0yawxYgmyH6jaUaz8sFiu3HlzJtyj2AA5+97nvaN30U5af9qrtm5wnatIhBG3qJU7
         IHVQTxxX1GIbVHVmmIqrlv42O2OQvWmK+bmfSdBS5WGCDxoUAZDddb6bF1JR4Zo6I7oj
         SZGgAs9Z7kLn2PiH9qDBtQ0y6kO5gBImsTFyT5uN0MLKUlizXeyF+Jm0UpK7i8fv4QRW
         aBM6zT4Sq4DHJyE7gGfrQqfL7r5hjOLi0giyhlSEWLQDlrNP1i/cOmWq8xsJzqHtLa4N
         QgQA3v1WYmMyYDtFYVi4w1AXy2EklOj5HlEi2S18gmX7ZEKHLv7Qp90axMjM+I7wU/aC
         lOIg==
X-Gm-Message-State: APjAAAXRvi6NTBxSCNMmU1AbySw5Hx8bGE7JxKvOtInZU5TZ+3xikl5c
        +PhEL7kZ5/vmyl8GV5w5a5ZzKA==
X-Google-Smtp-Source: APXvYqweauG+YK6x1oUHhM2R/NzXwxeZlWtJjJkH915o9vNzhAi8CToRGyd13k1Te0NB02ORTjn97w==
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr35460317ljj.34.1560951553415;
        Wed, 19 Jun 2019 06:39:13 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id b6sm3020618lfa.54.2019.06.19.06.39.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 06:39:12 -0700 (PDT)
Date:   Wed, 19 Jun 2019 06:25:43 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/4] dts changes for omap variants for v5.3
Message-ID: <20190619132543.ojwfslo7rbmznsog@localhost>
References: <pull-1560399818-512977@atomide.com>
 <pull-1560399818-512977@atomide.com-2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1560399818-512977@atomide.com-2>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jun 13, 2019 at 12:10:51AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.3/dt-signed
> 
> for you to fetch changes up to 8f62581f820d32eec9698e477ddff21ebfbe0541:
> 
>   Merge branch 'baltos' into omap-for-v5.3/dt (2019-06-12 00:57:27 -0700)
> 
> ----------------------------------------------------------------
> dts changes for omap variants for v5.3
> 
> This series of changes improves support for few boards:
> 
> - configure another lcd type for logicpd torpedo devkit
> 
> - a series of updates for am335x phytec boards
> 
> - configure mmc card detect pin for am335x-baltos

Merged, thanks!


-Olof
