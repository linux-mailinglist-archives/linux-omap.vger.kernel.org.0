Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 881675CDCE
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jul 2019 12:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbfGBKqE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Jul 2019 06:46:04 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34302 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfGBKqE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Jul 2019 06:46:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id u18so704643wru.1
        for <linux-omap@vger.kernel.org>; Tue, 02 Jul 2019 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hO+sbYk0/T3jqctI9JR6vxxLVs1uBzFmGyJcEcM/u7Y=;
        b=jqGCSlZ3S2DRiKfYs7CyPMFx3xD5pgHjSkZEFir+NedOMLTobyr7ozdm1t2GT34K2f
         PUxMk87jPfURZEPfak7QFdtwvU9GSpZxLr//SV8PZv2WyZ+icEHNCESjpHeyAAvGHVMt
         5OvKmg6cjgRQaSxB58O7OQOXWyTbri0M7Hm/jTFcKezt9FFvKAUCkebVUzmr7paluaPu
         cXEP2NXz5TZZURRxHgTWUIPKxxw8Ccyr0hUGXm4WL3e6AGvsXEWKVvX8K9sLPv4Gpdev
         PVQLYhvbngH92sZNcsqtgAhCIV/2p6D9dkkUQgtrNKq+FBvDU0n2ZskRiPZ/nFT4gnTG
         IZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hO+sbYk0/T3jqctI9JR6vxxLVs1uBzFmGyJcEcM/u7Y=;
        b=Ws8SkipwOh3b+a76S7AQed2LhMpy2E59rZAzWVw67aW86DmsGKwnRiHp3L05WflFMq
         Wi6MFKE+DD9bay8jjM/nr0anJajh34DIesG6QHxe0KlAnDFtY96WI7wbQDuYmyjnd6M3
         JqLystqB0hQYEBrxXeLu2RLeO9Ik7Sih3/TEbcvMgQzPTGDkucsrh0tTVzouYXjqx1zz
         3HtchtLVnXyWFra1LUUIFRBvzyHx+OktK0kyBPgcEmiMimNGhI0YuhKMP2ENChlyi9ee
         K/sAhGTthktkR7UiCg/PFZRbw8FmETYsoZo6IR8Xqjb/Kde8r+zQmmyUvDF5JK6GrNjk
         YANA==
X-Gm-Message-State: APjAAAWUtJs8Ed1FZUyphRK5RuN0eLjK83gYZ/5RNTdr4DyZygyj+7Vc
        04QQN+QY6Z7AXZ9NU1IkaT7RJg==
X-Google-Smtp-Source: APXvYqwvBhx5ZJSggS8b1mH+WYdJHochpCwgOtEjyu9ydzm4KH+ZNxKOcOGbvkkK/2G8B2Kzc6Z2wA==
X-Received: by 2002:a5d:4d10:: with SMTP id z16mr10442850wrt.112.1562064362257;
        Tue, 02 Jul 2019 03:46:02 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id o20sm33429611wrh.8.2019.07.02.03.46.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 03:46:01 -0700 (PDT)
Date:   Tue, 2 Jul 2019 11:46:00 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Keerthy <j-keerthy@ti.com>
Cc:     broonie@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, t-kristo@ti.com
Subject: [GIT PULL v2] Immutable branch between MFD and Regulator due for the
 v5.3 merge window
Message-ID: <20190702104600.GE4652@dell>
References: <20190612144620.28331-1-j-keerthy@ti.com>
 <20190617070341.GC16364@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190617070341.GC16364@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Mark,

This is a subsequent pull which contains the /* fall-through */ fix.

Enjoy!

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-regulator-v5.3-1

for you to fetch changes up to f3f4363b1239584efc1a22c5ca0f2308e5693c38:

  regulator: lp87565: Fix missing break in switch statement (2019-07-02 11:41:23 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v5.3 merge window

----------------------------------------------------------------
Colin Ian King (1):
      regulator: lp87565: Fix missing break in switch statement

Keerthy (3):
      dt-bindings: mfd: lp87565: Add LP87561 configuration
      mfd: lp87565: Add support for 4-phase LP87561 combination
      regulator: lp87565: Add 4-phase lp87561 regulator support

 Documentation/devicetree/bindings/mfd/lp87565.txt | 36 +++++++++++++++++++++++
 drivers/mfd/lp87565.c                             |  4 +++
 drivers/regulator/lp87565-regulator.c             | 18 +++++++++++-
 include/linux/mfd/lp87565.h                       |  2 ++
 4 files changed, 59 insertions(+), 1 deletion(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
