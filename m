Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A213E86EF
	for <lists+linux-omap@lfdr.de>; Wed, 11 Aug 2021 02:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235568AbhHKAEA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Aug 2021 20:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234289AbhHKAEA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Aug 2021 20:04:00 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A96DC061765
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 17:03:37 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id qk33so503438ejc.12
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 17:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=x8YBzcp9J7sIIcKvJ91gEevJKo3BkB0p3cRSz2JtjBw=;
        b=PxVmSBk8sUcuhFPP9jNIONX/Ci6WXxS1j+QLs/gl1tSNq+SoSr0RobJAhvoyRZYmON
         jHjG2bWhP/JLf70sjs6hmco1GGuGCXF2tjEU/PXTHflcxjGLClorieSosnsKymI785WC
         pYhpws/yl09mA0f6cxFY61bd4zAxiHA2TCTJUyB9vUzVtkCvu3HTemvewRCEgJcZL4nj
         8Fs76WBrNDbM5VV/lrdjgLw2ELjtLlpFdqJkSu31qliaBsmtqWV4qZ72RhEVRnd2fB9i
         yd6q2nSS9mDADPRFf9SnA9NlWs5mNJnuB7GzF8DAtTUY3GsfsAnR66BeuBSdtvhbNs09
         oo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=x8YBzcp9J7sIIcKvJ91gEevJKo3BkB0p3cRSz2JtjBw=;
        b=WJKDO3N+NQ9L50SC1CYRmZEClMU2bTXnDOewsYMDxDpUuQ8CHXo/R8sbDpZWtBDta9
         Wq0oT46SgA/twykhNv9/WA+8vc3UOjQqMw+cGGSz8VKbdC/0YQ1WpiiQ3yeP5r07PB3U
         0jw6owsq1QeTR8dJhw/NRG4TqanzlgzfXslO+kxzVoIBuo1oAmrwVLxa20gnlLQt9w03
         waWMfjgOcddBGI+ug0pZGjg6RzBnh9yAiPAOVuHJHwSDxwyZtExKxTNRnxgJfZu2oC/c
         koK9EsUTUT4KWuqsCRws2BPtiBw/+l8DpxQYwqGkPFoA2qlYpNhm6xld5e1KNQj+G+x1
         q3wQ==
X-Gm-Message-State: AOAM533OjfGyNu+HYe5DSKLeohNBnMvxakTHIZajLZZ7sCzD4Alx6l4V
        h+5BOvY+SKpOHUdUjGr/SdjtC4adGLV6PA==
X-Google-Smtp-Source: ABdhPJz2JJ48Eh35mVgtuidsXSqT+oSDNmhtm4chCbPZCFFw4f4xyiXEG/N+PQL0Fe2VjfILDHgkiA==
X-Received: by 2002:a17:906:404:: with SMTP id d4mr947819eja.449.1628640216029;
        Tue, 10 Aug 2021 17:03:36 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id q30sm974026edi.84.2021.08.10.17.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 17:03:35 -0700 (PDT)
Date:   Wed, 11 Aug 2021 02:03:33 +0200
From:   Ben Hutchings <ben.hutchings@mind.be>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-crypto@vger.kernel.org, linux-omap@vger.kernel.org,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 0/2] omap-crypto fixes
Message-ID: <20210811000333.GA22095@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

These are two non-urgent fixes for the omap-crypto drivers.

Ben.

Ben Hutchings (2):
  crypto: omap - Avoid redundant copy when using truncated sg list
  crypto: omap - Fix inconsistent locking of device lists

 drivers/crypto/omap-aes.c    |  8 ++++----
 drivers/crypto/omap-crypto.c |  2 +-
 drivers/crypto/omap-des.c    |  8 ++++----
 drivers/crypto/omap-sham.c   | 12 ++++++------
 4 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.20.1
