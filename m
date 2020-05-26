Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A1B1E21BC
	for <lists+linux-omap@lfdr.de>; Tue, 26 May 2020 14:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbgEZMVi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 08:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728602AbgEZMVi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 May 2020 08:21:38 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE668C03E96D
        for <linux-omap@vger.kernel.org>; Tue, 26 May 2020 05:21:37 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id r15so2749882wmh.5
        for <linux-omap@vger.kernel.org>; Tue, 26 May 2020 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=m5ZWlOmPqfN4LJYDtQdbS2B39OIRK3rGm81p37Yiv94=;
        b=kFggymeFcfp5W2VhFcf4Ctw7Xw4coskXUBBpY3MvEccM80h9McYDsdhasJYh5mS8QJ
         6+PK1ttLD8rebuiDKp9g7H0hm2JhzXVzjD7eDlPQ9XjFQGR/OSuMsjUiy2f65QJd6Psl
         KThsgscJow5OmhsoB2e3s3hIB/TTUDTIA9VHb817UpV12if0I23hgXnwFbBJZvj9RD8M
         Q7Ne37jRdzHjugFvZai1JGoe1te+aBFVr/4hH4S830obgvWqrOHt2xTKxjgi9yw2lg3i
         YIOVpJ7fvfXWJ2uM046D9yRwO/Yju+bc/a5+K/Tui2qSgle+4BNrvz3pl95TwmLGnvP5
         +McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=m5ZWlOmPqfN4LJYDtQdbS2B39OIRK3rGm81p37Yiv94=;
        b=Cu3XvpCVykofzJi4qa84SpZtMlECUHE8165v6kNfiSrdWvC06GlG2vFwcasrQBwy3U
         WvgOC4QZd9QOlR7zjjbtwoCvvhiK2ukjSsTSKlf5qLftHaZ9HyKSM04tb9uopA2T10En
         UcFgjsl+pUwnXFYw4dTD/HVc1xqKGnO47oxnMoqXnb3JEFZ4eALEzufwOL8UkQPEvO/a
         OY4D09sQVtWbS4ZoOOuWRgscY2/Ub1S1v+Ax6gteZgLUAnHC0Bo3kVydVYzggyWSNkwo
         SUmUX0pybmTG9hIdNrs5x6VNqo2MK0IAAobOSC1XzcFhQbKsmB/baye1kaJr/uXmWj7n
         tmeQ==
X-Gm-Message-State: AOAM532BVQ8qFdSTEm3IN9ZGDnsavrxGGKkhYEMp3DtZlJQ/gbN3pgbY
        vESe2cAasXsBTQdUeuV5c5dt33QD0XFdVQ==
X-Google-Smtp-Source: ABdhPJwiIipJlyz87yn1c7UrIKg8ME81uBDuPuXqG0VooexuREt8W71yiizQpOWoZazTHGJVZjuz/g==
X-Received: by 2002:a7b:cb4e:: with SMTP id v14mr1135042wmj.164.1590495696581;
        Tue, 26 May 2020 05:21:36 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id i74sm21442036wri.49.2020.05.26.05.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 05:21:35 -0700 (PDT)
Date:   Tue, 26 May 2020 14:21:33 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200526122133.GA1454440@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Haojian and Linus,

For pcs_parse_one_pinctrl_entry() in drivers/pinctrl/pinctrl-single.c,
I see that num_maps is set to 2 if PCS_HAS_PINCONF is enabled:

1057         if (PCS_HAS_PINCONF && function) {
1058                 res = pcs_parse_pinconf(pcs, np, function, map);
1059                 if (res)
1060                         goto free_pingroups;
1061                 *num_maps = 2;
1062         } else {
1063                 *num_maps = 1;
1064         }
1065         mutex_unlock(&pcs->mutex);

git blame shows me that came from 9dddb4df90d13:
"pinctrl: single: support generic pinconf"

Would you be able to provide any insight as to num_maps needs to be 2
when pinconf is enabled?

thank you,
drew
