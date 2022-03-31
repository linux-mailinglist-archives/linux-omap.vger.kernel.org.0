Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 592534EDE65
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 18:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233760AbiCaQJo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 12:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234276AbiCaQJo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 12:09:44 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95CB1F1259
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 09:07:56 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id l7-20020a05600c1d0700b0038c99618859so1987042wms.2
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=gDhoX2vp0X4fbn9hhWYTzWQWTzyqRleqCJPPleiUnqg=;
        b=F+xZF83DzB0SIBCsJs9aZAXikTEhUFMQUrGTIqpEOb01/pOuBjXrfTE5ww51cVqE8V
         BMDVZgs6GrIg14zEP0k/TyG5xergPISMHkCypLwqBMmzGIP3c9YDgyXOLu9IgMfzKrmH
         EQgZ+XoTq/Dgo1LA91yWErQUmrUcQXiorLNlQKgQljMOo2SSJ0kzQyzsopbzIncF6NkG
         parfM4sWS2zvNcLQ8mCJXCDR+q1PulrxZGQJd2TpO4Zl6HF4xayc0F438TpVj40oe3L1
         SiOUSstml66Vw8PeGVNDhyOIBktL8BAiNDMWiYdZl1qE+E0wPrhrUFFsR88+jRg2Bsou
         UmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=gDhoX2vp0X4fbn9hhWYTzWQWTzyqRleqCJPPleiUnqg=;
        b=HYpdfEf31Kdx2ZY5LtgSJQaz4QNjNwJi1K+UEaj5LLiGqFTNvvOfn6W1Y7wfEgc/6T
         kHJC7zfg+pB65I+w4hXi+sDimGx5yQmg5+tDoYu8A4H6zPjTptaqQQn973bFhGfCKf1w
         QdR1Jmiv+IB4zC5iEnpxPoCMHXWcLCiOxIL6tyFVKTz3eu7aUz+pQt5IvuXdAr8p4qls
         kkYrzC3+5GJMLB//SpQ6vB0GidUKWmneH0CxSLK60I9/sfWkm/GreFRQD81zA1zaJJch
         xfDAernW2xAb5jMFzyw2Tu+lLcJba0CFHLm18pUvVd1wxbeEOyAGD5LkmiJHD2o5wlCa
         5oFQ==
X-Gm-Message-State: AOAM53115uKBHmPqrBuyomlQXzH/oQMfk2BCqm+Q9ypf/jZ6exlfEFUh
        dyk2fa9o39OvHW4dxqZUBe3p9pkldfQ=
X-Google-Smtp-Source: ABdhPJxL9bwcG83FhVnFAePVJi3GdezRfUBUFErjlCLAYsDhW6aPnWhj87WpOXziG/g4O4Pc3SoDQA==
X-Received: by 2002:a05:600c:190a:b0:38c:c9f9:f85b with SMTP id j10-20020a05600c190a00b0038cc9f9f85bmr5338023wmq.27.1648742875110;
        Thu, 31 Mar 2022 09:07:55 -0700 (PDT)
Received: from DESKTOP-R5VBAL5 ([39.53.224.185])
        by smtp.gmail.com with ESMTPSA id b5-20020adfde05000000b00205bdc6bd57sm11422181wrm.95.2022.03.31.09.07.53
        for <linux-omap@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 31 Mar 2022 09:07:54 -0700 (PDT)
Message-ID: <6245d1da.1c69fb81.8d821.e527@mx.google.com>
Date:   Thu, 31 Mar 2022 09:07:54 -0700 (PDT)
X-Google-Original-Date: 31 Mar 2022 12:07:54 -0400
MIME-Version: 1.0
From:   armanddreamlandestimation@gmail.com
To:     linux-omap@vger.kernel.org
Subject: Estimating Services
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AArmand Southern=0D=0ADreamland Estimation, LLC

