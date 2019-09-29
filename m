Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E59EC18F0
	for <lists+linux-omap@lfdr.de>; Sun, 29 Sep 2019 20:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbfI2SWY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 Sep 2019 14:22:24 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43392 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728755AbfI2SWX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 29 Sep 2019 14:22:23 -0400
Received: by mail-lf1-f67.google.com with SMTP id u3so5334156lfl.10
        for <linux-omap@vger.kernel.org>; Sun, 29 Sep 2019 11:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/GO4FoIF23z9uWn00UbU2BdUkZ0+OAL+wp3AO4KDJjQ=;
        b=YRgAeGNfVjEQCjWkxIGQDXsMLtDwC/xYouvsCdD4Shp7rkL0iLfeOlRtfCDxFomWm0
         G/xHVT/18rTZsrC7uKp9stYevvZIJTlieKzen/nJ/RnDEV7G22GyoHIjYC4KF6CBb6A/
         ViHz2F1GMgHK2Tj7cvUgEr4W5E0v7f3itaWiZsJkuJ5Pl+RfBDhvZMpXQ0oqeSF2n8sy
         bBk3t0FRuCm+eiDTE7HRaGodD4zbLyqqVqHrEwGhxXVkR3ShFA0oRJrCGw8f3N06Xl/D
         vfDcylgi0Ssp2C4Ayc2OA8W/2ssXeXsEJmDl1eDgCDQ4ixMYfDCaq48jdewFFxdTQoSK
         mKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/GO4FoIF23z9uWn00UbU2BdUkZ0+OAL+wp3AO4KDJjQ=;
        b=RKsZcb99neozj4dQnZG10z6KWQzFZhpbLKVz6E1BCRkUbfTEdfpzFV+m61UhkDib1v
         JYELHcPqEG3yf5N3eEEJn73Dk+5NHmRZnBf6u4baKTQhINDGX+GwRHN6xrREiA3ekblr
         hup2Qh6cNb9v9LQyvpKU+xtwFlP5OMOiFkMxn9UFmGh28xralIncOfgvEL8rOvAhoSxW
         KZ4yrqxNAEGvTSR3+htLmQN3r7pfC9Fs6Gj1lulLDnRaC5WW8Uv5pkfpkVwSoljch8b3
         narbru0yWlNc9dZu0S6lxHlSrRG1D4DCE9yC8cuOpaA+oKtJSCsOQjSBftNrRIoDBvUG
         hUSQ==
X-Gm-Message-State: APjAAAV3YVVL8rays3+FezVl8n1HpKE2mhL/kNVmNaVJ9cciyCcElv+R
        8HFtmSC3ZVcBRMd5TdXgCkglTg==
X-Google-Smtp-Source: APXvYqyOYEq9CmvSLcrYKNKKcBaSvai+dng0dea9xtrVsTmpJDzHLhxuZ5e2O9a0tomlN8PvAPkEYg==
X-Received: by 2002:a19:381a:: with SMTP id f26mr8778800lfa.168.1569781341873;
        Sun, 29 Sep 2019 11:22:21 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id i17sm2520983ljd.2.2019.09.29.11.22.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Sep 2019 11:22:20 -0700 (PDT)
Date:   Sun, 29 Sep 2019 10:49:39 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     soc@kernel.org, arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] fixes for omaps for v5.4 merge window
Message-ID: <20190929174939.5sgz6klvqzfcalkp@localhost>
References: <pull-1568819401-72461@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1568819401-72461@atomide.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 18, 2019 at 08:10:24AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 4a65bbb9109ed7edd4b6ed7168ced48abb8561a2:
> 
>   soc: ti: pm33xx: Make two symbols static (2019-08-13 05:05:38 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/fixes-5.4-merge-window
> 
> for you to fetch changes up to a4c8723a162e6244fb01944fbf446750575dba59:
> 
>   bus: ti-sysc: Remove unpaired sysc_clkdm_deny_idle() (2019-09-06 12:57:46 -0700)
> 
> ----------------------------------------------------------------
> Fixes for omap variants
> 
> Few fixes for ti-sysc interconnect target module driver for no-idle
> quirks that caused nfsroot to fail on some dra7 boards.
> 
> And let's fixes to get LCD working again for logicpd board that got
> broken a while back with removal of panel-dpi driver. We need to now
> use generic CONFIG_DRM_PANEL_SIMPLE instead.

Thanks, merged.


-Olof
