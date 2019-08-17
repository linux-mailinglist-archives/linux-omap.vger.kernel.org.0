Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2B491261
	for <lists+linux-omap@lfdr.de>; Sat, 17 Aug 2019 20:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfHQSrx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Aug 2019 14:47:53 -0400
Received: from mail-ed1-f46.google.com ([209.85.208.46]:33733 "EHLO
        mail-ed1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfHQSrx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Aug 2019 14:47:53 -0400
Received: by mail-ed1-f46.google.com with SMTP id s15so7839642edx.0
        for <linux-omap@vger.kernel.org>; Sat, 17 Aug 2019 11:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YPVmqMA5TIKEb8XscROjrSPmBtsu6vIIDxh37QqD3fw=;
        b=BrCegnClUcDcfVXa0kjAm2NcJJfrMhT0PvTrAUemLSsajpk5hfFLqkx/MEKmWdpDkW
         gIaxie0F8O5nWppMK1x83KvtTsWMepfW6/oShACENmiWdY9wGIGPWYrvhFuX8iA+yQJk
         J5rYD6kNqACrRLDQ40sopmf0MtNQF0Di2mxmv55njnB+5uoY/rddyPBdeqW1eWXCc5cL
         W75AqAT+AGxrvH8ud973I4Yz8QoDOwvXHGyN2PBb4HrvtQmTj49e9LN2rmsH2vGdj5dj
         gGALqCJECPcyG7T1Lq5znh7OOQ3ltCTksc0DrmGJueyWlhbqN5uVxFpk9gN/nrntukJE
         9q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YPVmqMA5TIKEb8XscROjrSPmBtsu6vIIDxh37QqD3fw=;
        b=KiprClBfBUzb3tGBMz8SLQqRZk4B6S0UqVrF45I2Ae6GJoEk53UClJwSu08TEW7l/K
         rrRUEX1azYtsObVseDPPjwwyi8MiGTuzeHpK3uwt/C4xIqWBQywd3H4tFnUZLszk/JQa
         C6LZKXyt2HY46tDvOQiy4sKRK9glBIYazu+/oIUSH1wdlSod6S0yTJKTt2w4yBGkARCm
         M7VgF7UY46UAyGIHvooGwS8uk0L60m8Bu9s+Dlukl8S2/vZJf8bkH8VBnWE8zhb8hcas
         BlOVv2A6ezkf5YJd5lICV/wmjNDTr1KXfdfoWKNxnGrGiQ/Feh9lNdMoUuUFriDLRXRc
         Ptqw==
X-Gm-Message-State: APjAAAU1YYpZQklxJp6IUf+4rIdNlWlIAMICwzUL2eW2+8O5lX6yomvA
        0+hZz1S941QQsxb+vn2zNtE=
X-Google-Smtp-Source: APXvYqyJ81wLVmnGJuRw1MCGvMJgMfUKl/JEtbBWAilEWagZ0qmxNGVMrx4h5VcV9gLktzWtV9RDBg==
X-Received: by 2002:a17:906:e009:: with SMTP id cu9mr14415168ejb.267.1566067671755;
        Sat, 17 Aug 2019 11:47:51 -0700 (PDT)
Received: from lepton (46.137.104.92.dynamic.wline.res.cust.swisscom.ch. [92.104.137.46])
        by smtp.gmail.com with ESMTPSA id g22sm1328943eje.84.2019.08.17.11.47.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 11:47:49 -0700 (PDT)
Date:   Sat, 17 Aug 2019 20:47:46 +0200
From:   =?UTF-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: omap36
Message-ID: <20190817204746.5e06b9cc@lepton>
In-Reply-To: <CAHCN7xJyhy9F6JLCG_Lz7EizNDGnA_wHgr13Xs91yo+zdp2c4Q@mail.gmail.com>
References: <CAHCN7xJXJ__Gm3x=eAKkXuRTi1tDJocddKUzSw8oeYXQzM4tuQ@mail.gmail.com>
        <20190814232816.4906f903@lepton>
        <CAHCN7xJyhy9F6JLCG_Lz7EizNDGnA_wHgr13Xs91yo+zdp2c4Q@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi Adam,

> What makes DVFS different from what cpufreq does by changing the
> operating voltage and frequency?

If I understood correctly, it actively measures and optimizes the
voltages applied by cpufreq since they change with
temperature/manufacturing differences/age. At higher frequencies
(i.e. 1GHz) this is required to not damage the chip or reduce its
lifetime.

Kind Regards,

 André 
