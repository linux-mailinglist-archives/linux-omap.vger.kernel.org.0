Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E062618444B
	for <lists+linux-omap@lfdr.de>; Fri, 13 Mar 2020 11:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgCMKFX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Mar 2020 06:05:23 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44387 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgCMKFX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Mar 2020 06:05:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id l18so11226925wru.11
        for <linux-omap@vger.kernel.org>; Fri, 13 Mar 2020 03:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DkgtdvOLhPq5sUtjHRHCpYAFEd/88KxYCJ5Q/7OZdAA=;
        b=WL8rtzOewU/9s+K0tvQpcOMXbr6z8K1b/4xg47mX7DzD3tGkqmlitudW6dcgGxCTUy
         ZnhpdCWiUyndV3kwVLwm4Kz9Y1OafWLeQQiRN9Ja3dy85aJ3z2Fwl+xp3bCkdryfSF4x
         EeZT+N7l9jLcATyhvvHXnq2+ggmZ4axNP8ELE8a5MrgQ0/h8zkmE+SDyru4TbGb+dlKl
         wE5mVpwdcjsn1PwQd7Ft03lUgseGNgXRaKYBNTIdaMVrLI8FuXLpZRiEa/NsJaaOZuob
         0Z4A10T7fdFLYy82VZu/Ld6XKr/AEabGd3ymvJgaiGCAUPA9VL/qJUVbEIiFc5tPB0aA
         bxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DkgtdvOLhPq5sUtjHRHCpYAFEd/88KxYCJ5Q/7OZdAA=;
        b=pRsUsMyiLQwjMzTDAZ1i6j7nKg+sjsR+4Y/4aoWAIzA34Esevp7hrXRJrmMe5bwPxb
         BujNmNnKjKhnPDbQJ/TAc16ni46OjVsvDXIj31TqdE4mF9cORrBXHuZBivXoQlnFjg1c
         X1VExaIVDdwrxzlW7JdXqjR4ePrYAH3D49vlSkcleQVASFt8wU7V+lap7zmF0IiJbhP4
         YOfFcSIEg03kz10lmRGju3hNGjIdENfT3TPfhlmq4g21sgSG8D/D7N3sssGqaefEkn6e
         DXnothmrwgnAdL0NVgGvCkA7pOrZu80j/DAyyUKvDJ9j1ginhQIpgTY+ADyE0c9dbSHa
         1yhQ==
X-Gm-Message-State: ANhLgQ1wlqNCunkQvddzYMC14zzF6gQ0cThPrReopjoQgZhangghAp8S
        PqalnW3h4cqfEaxPROBy+V4SGQ==
X-Google-Smtp-Source: ADFU+vuTRDG0n/eB58imQFTmEl0YspJzXhA4oFvRnCi/L172+s9nTOf1O8dWmim1NZPCcDnu+tPD+g==
X-Received: by 2002:a5d:5545:: with SMTP id g5mr965179wrw.290.1584093920811;
        Fri, 13 Mar 2020 03:05:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id x13sm16642987wmj.5.2020.03.13.03.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 03:05:20 -0700 (PDT)
Date:   Fri, 13 Mar 2020 10:05:16 +0000
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Morten.Rasmussen@arm.com,
        Dietmar.Eggemann@arm.com, javi.merino@arm.com,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com, rjw@rjwysocki.net,
        sudeep.holla@arm.com, viresh.kumar@linaro.org, nm@ti.com,
        sboyd@kernel.org, rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org
Subject: Re: [PATCH v4 1/4] PM / EM: add devices to Energy Model
Message-ID: <20200313100516.GB144499@google.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-2-lukasz.luba@arm.com>
 <20200313100407.GA144499@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313100407.GA144499@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Friday 13 Mar 2020 at 10:04:07 (+0000), Quentin Perret wrote:
> Not easy to figure out which device has a problem with this. I'm
> guessing you went that way since this is called before ida_simple_get() ?
> Could that be refactored to make the error message more useful ?

Bah, forget that one :)
